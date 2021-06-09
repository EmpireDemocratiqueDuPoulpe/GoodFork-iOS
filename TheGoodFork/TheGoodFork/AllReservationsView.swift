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

    let format = DateFormatter()

    @State var user: User
    
    
    func dayDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: Date())
    }

    func getHour(string: String) -> String{
        let tempLocale = format.locale
        format.locale = Locale(identifier: "en_US_POSIX")
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let date = format.date(from: string)!
        format.dateFormat = "HH:mm"
        format.locale = tempLocale // reset the locale
        let dateString = format.string(from: date)
        return dateString
    }

    @State var checked = false
    var body: some View {
            ScrollView{
                ForEach(Api.bookings, id: \.booking_id) { reserv in
                            if reserv.is_client_on_place != 0{
                                HStack{
                                    ToggleButtonView(showGreeting: (reserv.is_client_on_place != 0), name: reserv.user.first_name, id: reserv.booking_id, user: self.user )
                                    Text("\(self.getHour(string: reserv.time))")
                                }
                            }else{
                                HStack{
                                    ToggleButtonView(showGreeting: (reserv.is_client_on_place != 0), name: reserv.user.first_name, id: reserv.booking_id, user: self.user )
                                    Text("\(self.getHour(string: reserv.time))")
                                }
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
            }.navigationTitle("Réservations du \(self.dayDate())")

    }
}

struct AllReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        AllReservationsView(user: User(user_id: 1, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com"))
    }
}

