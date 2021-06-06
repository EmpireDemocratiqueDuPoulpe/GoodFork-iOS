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
    var last_name: String
    var email: String
}

struct Base: Codable {
    var user: User?
    var token: String?
    var code: Int
    var error: String?
    var fields: Array<String>?
}

struct Menu: Codable {
    var menus: [Recette]
}

struct Recette: Codable {
    var menu_id: Int
    var name: String
    var type: String
    var type_id: Int
    var image_path: String?
    var description: String?
    var price: Int
    var ingredients: [Ingredient]
}

struct Ingredient: Codable {
    var ingredient_id: Int
    var stock_id: Int
    var name: String
    var units: Int
    var units_unit: String
    var units_unit_id: Int
}
struct Bookings: Codable{
    var code: Int
    var bookings: [Booking]
}
struct Booking: Codable{
    var booking_id: Int
    var user: User
    var table: Table
    var time: String
    var clients_nb: Int
    var is_client_on_place: Int
    var can_client_pay: Int
}

struct Table: Codable{
    var table_id: Int
    var name: String
    var capacity: Int
}


class Api: ObservableObject {
    @Published var base: Base?
    @Published var user: User?
    @Published var token: String?
    @Published var recettes: [Recette] = []
    @Published var bookings: [Booking] = []
    
    init(){
        self.getCarte()
        if self.defaults.string(forKey: "Token") == nil {
            self.token = nil
            self.user = nil
        }else{
            self.token = self.defaults.string(forKey: "Token")
            self.loginToken(token: self.token!)
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
            do {
                if let data = data {
                    let base = try JSONDecoder().decode(Base.self, from: data)
                    DispatchQueue.main.async {
                        self.base = base
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
                            self.base = base
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
    func loginToken(token: String){
        guard let url = URL(string: "http://3.134.79.46:8080/api/users/login/token") else { return }
        
        let body: [String: String] = ["token": token]
        
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
                        }
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func getCarte(){
        guard let url = URL(string: "http://3.134.79.46:8080/api/menus/all") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        let menu = try JSONDecoder().decode(Menu.self, from: data)
                        DispatchQueue.main.async {
                            self.recettes = menu.menus
                        }
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func getBooking(){
        guard let url = URL(string: "http://3.134.79.46:8080/api/bookings/today/all") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let book = try JSONDecoder().decode(Bookings.self, from: data)
                        print("Bookings")
                        DispatchQueue.main.async {
                            self.bookings = book.bookings
                        }

                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func addBooking(userId: Int, time: Date, clientsNb: Int){
        guard let url = URL(string: "http://3.134.79.46:8080/api/bookings") else { return }
        let format = DateFormatter()
        format.dateFormat = "YYYY-MM-dd hh:mm"
        let body: [String: Any] = ["user_id": userId, "time": format.string(from: time), "clients_nb": clientsNb]
                
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let data = data {
                    print(response)
                }
            } catch {
                print(error)
            }
        }.resume()
                }

    
    func addCommand(comm: ContentCommand){
        var test: [[String: Int]] = []
        for item in comm.menus {
            var lol = ["menu_id": item.menu_id, "price": item.price]
            print(type(of: lol))
            print(type(of: test))
            print(lol)
            test.append(lol)
            print(test)
        }
            guard let url = URL(string: "http://3.134.79.46:8080/api/orders") else { return }
        let body: [String: Any] = ["user_id": comm.user_id, "menus": test, "is_take_away": comm.is_take_away ]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        let jsonString = String(data: finalBody, encoding: String.Encoding.ascii)!
        print (jsonString)
        
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        print(data)
                    }
                } catch {
                    print(error)
                }
            }.resume()
    }
    
    
    func saveUser(){
        self.defaults.set(self.token, forKey: "Token")
    }
}
