//
//  API.swift
//  Cardisc
//
//  Created by Tim van Kesteren on 20/11/2022.
//

import Foundation

class ApiService {
    // GET request
    func getData<T: Decodable>
    (
        body: Dictionary<String, AnyHashable>?,
        url: String,
        model: T.Type,
        completion:@escaping(T) -> (),
        failure:@escaping(Error) -> ()
    )
    {
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        }
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    //POST request
    func postData<T: Decodable>
    (
        token: String?,
        body: Dictionary<String, AnyHashable>?,
        url: String,
        model: T.Type,
        completion:@escaping(T) -> (),
        failure:@escaping(Error) -> ()
    )
    {
        
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        //if token is given with at the manager
        if let token = token {
            request.setValue("bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        //if body is given with at the manager
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
