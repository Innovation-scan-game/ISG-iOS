
import SwiftUI
import Foundation
import MultipartForm


struct TestView: View {
    @State private var image: Image?
    @State private var imageData: Data?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            image?.resizable().frame(width: 200, height: 200)
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Selecteer Afbeelding")
            }
            
            Button(action: {
                // Maak de URL voor de request
                let url = URL(string: Constants.API_BASE_URL + "user/avatar")!
                
                let formData = MultipartForm(parts: [
                    MultipartForm.Part(name: "file", data: imageData!, filename: "avatarPlayer.png", contentType: "image/png"),
                ])

                var request = URLRequest(url: URL(string: Constants.API_BASE_URL + "user/avatar")!)
                request.httpMethod = "POST"
                request.setValue(formData.contentType, forHTTPHeaderField: "Content-Type")

                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    do {
                        let response = try JSONDecoder().decode(userDto.self, from: data)
                    }
                    catch{
                        print("error: \(error.localizedDescription)")
                    }
                }
                
                task.resume()
            }) {
                Text("Verstuur Afbeelding")
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, imageData: self.$imageData)
        }
    }
    
    struct ImagePicker: UIViewControllerRepresentable {
        @Binding var image: Image?
        @Binding var imageData: Data?
        @Environment(\.presentationMode) var presentationMode
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            
        }
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            var parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = Image(uiImage: uiImage)
                    parent.imageData = uiImage.pngData()
                }
                
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    }
}
