//
//  Api.swift
//  TheGoodFork
//
//  Created by admin on 11/05/2021.
//

import Foundation

struct User: Codable{
    var user_id: Int
    var role: String
    var first_name: String
    var last_name: String?
    var email: String
}

struct Base: Codable {
    var user: User?
    var token: String?
    var code: Int
    var error: String?
    var fields: Array<String>?
}

class Api: ObservableObject {
    @Published var user: User?
    @Published var token: String?
    init(){
        if self.defaults.string(forKey: "Token") == nil && self.defaults.object(forKey: "User") == nil{
            self.token = nil
            self.user = nil
        }else{
            if let savedUser = self.defaults.object(forKey: "User") as? Data {
                let decoder = JSONDecoder()
                if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                    self.user = loadedUser
                }
            }
            self.token = self.defaults.string(forKey: "Token")
        }
    }

    let defaults = UserDefaults.standard

    func addUser(lastName: String, firstName: String, email: String, password1: String, password2: String){
        guard let url = URL(string: "http://3.134.79.46:8080/api/users") else { return }
        
        let body: [String: String] = ["last_name": lastName, "first_name": firstName, "email": email, "password1": password1, "password2": password2]
                
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            print(data ?? "test")
        }.resume()
                }
    
    func login(email: String, password: String){
        guard let url = URL(string: "http://3.134.79.46:8080/api/users/login") else { return }
        
        let body: [String: String] = ["email": email, "password": password]
        
            let finalBody = try! JSONSerialization.data(withJSONObject: body)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        let base = try JSONDecoder().decode(Base.self, from: data)
                        DispatchQueue.main.async {
                            self.user = base.user
                            self.token = base.token
                            self.saveUser()
                        }
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func saveUser(){
        self.defaults.set(self.token, forKey: "Token")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.user){
            self.defaults.set(encoded, forKey: "User")
        }
        print(self.user?.role ?? "test")
    }
}
