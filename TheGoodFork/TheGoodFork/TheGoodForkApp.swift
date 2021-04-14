//
//  TheGoodForkApp.swift
//  TheGoodFork
//
//  Created by admin on 12/04/2021.
//

import SwiftUI

@main
struct TheGoodForkApp: App {
    
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ConnexionView(router: router)
        }
    }
}
