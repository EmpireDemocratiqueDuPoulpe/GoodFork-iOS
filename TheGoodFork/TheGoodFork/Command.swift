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
    var last_name: String?
    var email: String
}

class Command: ObservableObject {

    init(){

    }



}

