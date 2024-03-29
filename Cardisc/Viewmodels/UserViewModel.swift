//
//  UserViewModel.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 26/11/2022.
//

import Foundation
import SwiftUI
import PhotosUI
import MultipartForm

class UserViewModel: ObservableObject {
    private let userManager = UserManager()
    private var tempUser: [String: AnyHashable] = [:]
    
    @Published var currentUser = User(id: "", username: "", email: "", picture: "")
    @Published var showDeleteUserComfirmation: Bool = false
    @Published var userDeleted: Bool = false
    @Published var confirmMessageShow: Bool = false
    @Published var selectedItems: [PhotosPickerItem] = []
    @Published var data: Data?
    @Published var image: Image?
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var password2: String = ""
    @Published var errorMsg: String = ""
    @Published var changedUserDetails = ""
    @Published var updatedUser: Bool = false
    @Published var imageLoading: Bool = false
    @Published var editingUserCredentials: Bool = false
    
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await uploadAvatar(from: imageSelection)
                }
            }
        }
    }
    
    init(currentUser: userDto = userDto(id: "", username: "", email: "", picture: "")) {
        if let currentUser = UserDefaults.standard.data(forKey: "user") {
            do {
                let decoder = JSONDecoder()
                self.currentUser = try decoder.decode(userDto.self, from: currentUser).toDomainModel()
                self.username = self.currentUser.username
                self.email = self.currentUser.email
                
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        else {
            print("No user found")
        }
    }
    
    func logoffUser() {
        userManager.logoffUser()
    }
    
    func deleteUser() {
        DispatchQueue.main.async {
            self.userManager.deleteUserById(id: self.currentUser.id)
            UserDefaults.standard.removeObject(forKey: "X-AUTHTOKEN")
            UserDefaults.standard.removeObject(forKey: "user")
            self.userDeleted = true
        }
        
    }
    
    func updateUser() {
        self.errorMsg = ""
        self.changedUserDetails = ""
        self.updatedUser = false
        
        
        if(self.username != self.currentUser.username) {
            if(!self.username.isEmpty) {
                self.changedUserDetails += "Username \(currentUser.username) -> \(self.username) \n"
            }
            else {
                self.errorMsg = "login_error_3".localized()
            }
        }
        
        if(self.email != self.currentUser.email) {
            if(!self.email.isEmpty) {
                self.changedUserDetails += "Email \(currentUser.email) -> \(self.email) \n"
            }
            else {
                self.errorMsg = "login_error_4".localized()
            }
        }
        
        if(self.password != "" && self.password2 != "") {
            if(password == password2) {
                self.changedUserDetails += "Password ****** -> \(self.password) \n"
            }
            else {
                self.errorMsg = "register_error_3".localized()
            }
        }
        
        if(self.errorMsg.isEmpty && !self.changedUserDetails.isEmpty) {
            DispatchQueue.main.async {
                self.userManager.updateUser(username: self.username, password: self.password, email: self.email) { data in
                    if(data?.username != nil) {
                        self.currentUser = data!
                        self.updatedUser = true
                    }
                    else {
                        self.errorMsg = "register_error_6".localized()
                    }
                }
            }
        }
        
        if(self.changedUserDetails == "") {
            self.changedUserDetails = "None"
        }
    }
    
    func uploadAvatar(from imageSelection: PhotosPickerItem?) async throws {
        self.imageLoading = true
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.userManager.uploadAvatar(uiimage: uiImage, id: self.currentUser.id) { data in
                        if let data = data {
                            self.currentUser = data
                            self.imageLoading = false
                        }
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}

