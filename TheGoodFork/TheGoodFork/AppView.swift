//
//  AppView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var Api: Api
    
    @StateObject var router: Router

    @State private var filterByType = "Entrée"
    
    var body: some View {
        if Api.token != nil{
            switch router.currentPage {
                case .register:
                    HomeView(router: router, username: Api.user?.first_name ?? "").navigationBarHidden(true)
                case .connection:
                    HomeView(router: router, username: Api.user?.first_name ?? "").navigationBarHidden(true)
                case .home:
                    HomeView(router: router, username: Api.user?.first_name ?? "").navigationBarHidden(true)
                case .carte:
                    CarteView(filterByType: $filterByType)
            }
        }
        else{
            switch router.currentPage {
                case .register:
                    InscriptionView(router: router).navigationBarHidden(true)
                case .connection:
                    ConnexionView(router: router).navigationBarHidden(true)
                case .home:
                    ConnexionView(router: router).navigationBarHidden(true)
                case .carte:
                    ConnexionView(router: router).navigationBarHidden(true)
            }
        }


    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(router: Router())
    }
}
