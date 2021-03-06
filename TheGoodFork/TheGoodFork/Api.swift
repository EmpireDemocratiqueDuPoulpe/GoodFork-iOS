//
//  Api.swift
//  TheGoodFork
//
//  Created by admin on 11/05/2021.
//

import Foundation

//Data class servant à la recuperation des donnees
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
    var price: Float
    var ingredients: [Ingredient]
    var how_much: Int?
}

struct Ingredient: Codable {
    var ingredient_id: Int
    var stock_id: Int
    var name: String
    var units: Float
    var units_unit: String
    var units_unit_id: Int
    var stock_units_unit: String
    var stock_units_unit_id: Int
    var unit_price: Float
}
struct Bookings: Codable{
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
    var is_finished: Int
}

struct Table: Codable{
    var table_id: Int
    var name: String?
    var capacity: Int
}

struct Orders: Codable{
    var orders: [Order]
}
struct Book: Codable{
    var booking_id: Int
    var user_id: Int
    var table_id: Int
    var time: String
    var clients_nb: Int
}
struct Order: Codable{
    var order_id: Int
    var user: User
    var booking: Book?
    var additional_infos: String?
    var total_price: Float
    var is_take_away: Int
    var is_finished: Int
    var time: String
}

struct OrderMenus: Codable {
    var menus: [OrderMenu]
}

struct OrderMenu: Codable{
    var order_id: Int
    var menu_id: Int
    var name: String
    var type: String
    var type_id: Int
    var price: Float
    var is_finished: Int
}

struct AllWaiting: Codable{
    var menus: [Waiting]
}

struct Waiting: Codable, Equatable{
    var menu_count: Int
    var menu_id: Int
    var order_id: Int
    var asking_time: String?
    var type: String
    var type_id: Int
    var name: String
}

struct Type: Codable{
    var entree: [Waiting]
    var plat: [Waiting]
    var dessert: [Waiting]
    var boisson: [Waiting]
}

//Class Api contenant toutes les fonctions servant aux requetes Api
class Api: ObservableObject {
    @Published var base: Base?
    @Published var user: User?
    @Published var token: String?
    @Published var recettes: [Recette] = []
    @Published var bookings: [Booking] = []
    @Published var orders: [Order] = []
    @Published var viewOrder: [OrderMenu] = []
    @Published var customerBooking: [Booking] = []
    @Published var isOn: Bool = false
    @Published var pay: Bool = false
    @Published var commanded: Bool = false
    @Published var currentBookingId: Int = -1
    @Published var allWaiting: [Waiting] = []
    @Published var allOrderId = [String: Type]()
    
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
                            self.getCustomerBooking(user_id: base.user!.user_id)
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
                        DispatchQueue.main.async {
                            self.bookings = book.bookings
                        }

                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func getCustomerBooking(user_id: Int){
        guard let url = URL(string: "http://3.134.79.46:8080/api/bookings/user_id/\(user_id)") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let book = try JSONDecoder().decode(Bookings.self, from: data)
                        DispatchQueue.main.async {
                            self.customerBooking = book.bookings
                            self.isOnPlace()
                            if self.isOn {
                                self.getOrdersByUserId(user_id: user_id)
                            }
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
    
    func updateBokking(bookingId: Int, isClientOnPlace: Bool){
        guard let url = URL(string: "http://3.134.79.46:8080/api/bookings") else { return }
        
        let body: [String: Any] = ["booking_id": bookingId, "is_client_on_place": isClientOnPlace]
                
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            do {
                if let data = data {
                    self.getBooking()
                    print(response)
                }
            } catch {
                print(error)
            }
        }.resume()
                }
    
    func getOrders(order_id: Int){
        guard let url = URL(string: "http://3.134.79.46:8080/api/orders/menus/order_id/\(order_id)") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let ord = try JSONDecoder().decode(OrderMenus.self, from: data)
                        DispatchQueue.main.async {
                            self.viewOrder = ord.menus
                        }
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    
    func getDayOrders(){
        guard let url = URL(string: "http://3.134.79.46:8080/api/orders/today/all") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let ord = try JSONDecoder().decode(Orders.self, from: data)
                        DispatchQueue.main.async {
                            self.orders = ord.orders
                        }
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func addCommand(comm: ContentCommand){
        var command: [[String: Any]] = []
        for item in comm.menus {
            var ingredientList: [[String: Any]] = []
            for ingredient in item.ingredients{
                ingredientList.append(["ingredient_id": ingredient.ingredient_id, "stock_id": ingredient.stock_id, "name": ingredient.name, "units": ingredient.units, "units_unit": ingredient.units_unit, "units_unit_id": ingredient.units_unit_id])
            }
            command.append(["menu_id": item.menu_id, "price": item.price, "ingredients": ingredientList])
        }
            guard let url = URL(string: "http://3.134.79.46:8080/api/orders") else { return }
        let body: [String: Any] = ["user_id": comm.user_id, "menus": command, "is_take_away": comm.is_take_away ]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        let jsonString = String(data: finalBody, encoding: String.Encoding.ascii)!
        
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        self.commanded = true
                        print(data)
                    }
                } catch {
                    print(error)
                }
            }.resume()
    }
    
    func addTakeAwayCommand(comm: ContentCommand){
        var command: [[String: Any]] = []
        for item in comm.menus {
            var ingredientList: [[String: Any]] = []
            for ingredient in item.ingredients{
                ingredientList.append(["ingredient_id": ingredient.ingredient_id, "stock_id": ingredient.stock_id, "name": ingredient.name, "units": ingredient.units, "units_unit": ingredient.units_unit, "units_unit_id": ingredient.units_unit_id])
            }
            command.append(["menu_id": item.menu_id, "price": item.price, "ingredients": ingredientList])
        }
            guard let url = URL(string: "http://3.134.79.46:8080/api/payment/takeaway") else { return }
        let body: [String: Any] = ["user_id": comm.user_id, "menus": command, "is_take_away": comm.is_take_away ]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        let jsonString = String(data: finalBody, encoding: String.Encoding.ascii)!
        
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
    
    func getAllWaitings(){
        guard let url = URL(string: "http://3.134.79.46:8080/api/orders/menus/waiting") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let wait = try JSONDecoder().decode(AllWaiting.self, from: data)
                        DispatchQueue.main.async {
                            self.allWaiting = wait.menus
                        }
                        for order in self.allWaiting {
                            if self.allOrderId["\(order.order_id)"] != nil{
                                var actual = self.allOrderId["\(order.order_id)"]
                                switch order.type {
                                case "entrée":
                                    if !actual!.entree.contains(order){
                                        actual!.entree.append(order)
                                    }
                                case "plat":
                                    if !actual!.plat.contains(order){
                                        actual!.plat.append(order)
                                    }
                                case "dessert":
                                    if !actual!.dessert.contains(order){
                                        actual!.dessert.append(order)
                                    }
                                default:
                                    if !actual!.boisson.contains(order){
                                        actual!.boisson.append(order)
                                    }
                                }
                                self.allOrderId.updateValue(actual!, forKey: "\(order.order_id)")
                            }else{
                                var toAdd = Type(entree: [], plat: [], dessert: [], boisson: [])
                                switch order.type {
                                case "entrée":
                                    toAdd.entree.append(order)
                                case "plat":
                                    toAdd.plat.append(order)
                                case "dessert":
                                    toAdd.dessert.append(order)
                                default:
                                    toAdd.boisson.append(order)
                                }
                                self.allOrderId.updateValue(toAdd, forKey: "\(order.order_id)")
                            }
                        }
                    
                    }
                } catch {
                    print(error)
                }

            }.resume()
        }
    
    func getOrdersByUserId(user_id: Int){
        guard let url = URL(string: "http://3.134.79.46:8080/api/orders/user_id/\(user_id)") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) {(data, response, error) in
                do {
                    if let data = data {
                        
                        let ord = try JSONDecoder().decode(Orders.self, from: data)
                        DispatchQueue.main.async {
                            if ord.orders.count > 0 {
                                self.commanded = true
                                self.getOrders(order_id: ord.orders[0].order_id)
                            }
                            self.canPay(ord: ord.orders)
                        }
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    func payCommand(booking_id: Int){
            guard let url = URL(string: "http://3.134.79.46:8080/api/payment/booking") else { return }
        let body: [String: Any] = ["booking_id": booking_id]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        let jsonString = String(data: finalBody, encoding: String.Encoding.ascii)!
        
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
    
    func logout(){
        self.defaults.set(nil, forKey: "Token")
        self.token = nil
        self.user = nil
    }
    
    func saveUser(){
        self.defaults.set(self.token, forKey: "Token")
    }
    
    func isOnPlace(){
        for booking in self.customerBooking {
            if booking.is_client_on_place != 0 {
                self.currentBookingId = booking.booking_id
                self.isOn = true
            }
        }
        
    }
    
    func canPay(ord: [Order]){
        for order in ord {
            if order.is_finished != 0 {
                self.pay = true
            }
        }
    }
        
}
