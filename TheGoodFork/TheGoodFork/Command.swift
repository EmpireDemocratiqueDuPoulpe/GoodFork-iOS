//
//  Command.swift
//  TheGoodFork
//
//  Created by admin on 19/05/2021.
//

import Foundation

struct ContentCommand: Codable{
    var user_id: Int
    var role: String
    var first_name: String
    var last_name: String
    var email: String
    var plats: [Plat]
}
struct Plat: Codable{
    var id: Int
    var name: String
    var price: Int
    var type: String
}


class Command: ObservableObject {

    @Published var platList: ContentCommand
    init(userId: Int, role: String, first_name: String, last_name: String, email: String){
        self.platList = ContentCommand(user_id: userId, role: role, first_name: first_name, last_name: last_name, email: email, plats: [])
    }
    
    func addPlat(plat: Plat){
        self.platList.plats.append(plat)
        print(self.platList.plats)
    }
}

