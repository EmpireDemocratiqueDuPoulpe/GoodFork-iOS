//
//  AllReservationsView.swift
//  TheGoodFork
//
//  Created by admin on 06/06/2021.
//

import SwiftUI
import UIKit

struct AllReservationsView: View {
    
    @EnvironmentObject var Api: Api
    
    var body: some View {
        Text("Réservations du")
        
        NavigationLink(destination: ReservationView()){
                HStack{
                    Spacer()
                    Text("Nouvelle réservation").font(.system(size: 20)).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10).padding(.horizontal,  30)
                .background(Color.blue)
        }
    }
}

struct AllReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        AllReservationsView()
    }
}

