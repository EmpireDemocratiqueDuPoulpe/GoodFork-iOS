//
//  Command.swift
//  TheGoodFork
//
//  Created by admin on 19/05/2021.
//

import Foundation

struct ContentCommand: Codable{
    var user_id: Int
    var menus: [Plat]
    var  is_take_away: Bool
}
struct Plat: Codable{
    var menu_id: Int
    var price: Int
}

struct PlatInfos: Codable, Identifiable{
    var id: String {
        get { return self.name }
            set { self.name = newValue }
        }
    var name: String
    var price: Int
    var type: String
    var count: Int
}


class Command: ObservableObject {

    @Published var platList: ContentCommand
    @Published var commandPlat = [Int : PlatInfos]()
    
    init(userId: Int, isTakeAway: Bool){
        print("NOOOOOOOO")
        self.platList = ContentCommand(user_id: userId, menus: [], is_take_away: isTakeAway)
    }
    
    func addPlat(id: Int, name: String, price: Int, type: String ){
        self.platList.menus.append(Plat(menu_id: id, price: price))
        print(self.platList)
        var newCount: Int
        if self.commandPlat[id] != nil{
            newCount = self.commandPlat[id]!.count + 1
        }
        else {
            newCount = 1
        }
        self.commandPlat.updateValue(PlatInfos(name: name, price: price, type: type, count: newCount), forKey: id)
        print(commandPlat)
    }
    func deletePlat(id: Int, name: String, price: Int, type: String ){
        if self.commandPlat[id]!.count == 1{
            self.commandPlat.removeValue(forKey: id)
        }
        else {
            self.commandPlat.updateValue(PlatInfos(name: name, price: price, type: type, count: self.commandPlat[id]!.count-1), forKey: id)
        }
        print(commandPlat)
    }
    
}

