//
//  Data.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//
struct Plat: Hashable {
    let price: Int
    let name: String
    let image: String
    let type: String
}

let plats = [
    Plat(price: 10, name: "pizza", image: "logo-white", type: "Plat"),
    Plat(price: 15, name: "mousse chocolat", image: "nourriture", type: "Dessert"),
    Plat(price: 20, name: "macédoine", image: "logo-white", type: "Entrée"),
    Plat(price: 5, name: "coca-cola", image: "nourriture", type: "Boisson"),
    Plat(price: 20, name: "pattes", image: "nourriture", type: "Plat"),
    Plat(price: 15, name: "crepes", image: "logo-white", type: "Dessert"),
    Plat(price: 20, name: "ravioli", image: "logo-white", type: "Entrée"),
    Plat(price: 5, name: "eau", image: "nourriture", type: "Boisson"),
    Plat(price: 10, name: "hamburger", image: "logo-white", type: "Plat"),
    Plat(price: 15, name: "titamisu", image: "logo-white", type: "Dessert"),
    Plat(price: 20, name: "Salade", image: "nourriture", type: "Entrée"),
    Plat(price: 5, name: "bière", image: "logo-white", type: "Boisson"),
    Plat(price: 10, name: "bla", image: "logo-white", type: "Plat"),
    Plat(price: 15, name: "bli", image: "logo-white", type: "Dessert"),
    Plat(price: 20, name: "riz", image: "logo-white", type: "Entrée"),
    Plat(price: 5, name: "kiki", image: "logo-white", type: "Boisson"),
]
