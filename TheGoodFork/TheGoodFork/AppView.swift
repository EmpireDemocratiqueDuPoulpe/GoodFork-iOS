//
//  AppView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI

struct AppView: View {

    @StateObject var router: Router

    @State private var filterByType = "Entrée"
    
    var body: some View {
        switch router.currentPage {
        case .register:
            InscriptionView(router: router).navigationBarHidden(true)
        case .connection:
            ConnexionView(router: router).navigationBarHidden(true)
        case .home:
            HomeView(router: router).navigationBarHidden(true)
        case .carte:
            CarteView(filterByType: $filterByType)
        }

    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(router: Router())
    }
}
