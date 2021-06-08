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
    let date = Date()
    let formatter = DateFormatter()
    let format = DateFormatter()
    let recup = DateFormatter()
    var result: String
    init(){
        recup.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        format.dateFormat = "hh:mm"
        formatter.dateFormat = "dd/MM/yyyy"
        result = formatter.string(from: date)
    }

    

    @State var checked = false
    var body: some View {
        Text("Réservations du \(self.result)").font(.headline)
        ForEach(Api.bookings, id: \.booking_id) { reserv in
                HStack{
                    ToggleButtonView(showGreeting: (reserv.is_client_on_place != 0), name: reserv.user.first_name, id: reserv.booking_id)
                    Text("\(format.string(from: recup.date(from: reserv.time) ?? Date()))")
                }
        }.padding(.horizontal, 10)
        
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

