//
//  ToggleButtonView.swift
//  TheGoodFork
//
//  Created by admin on 07/06/2021.
//

import SwiftUI
import UIKit

struct ToggleButtonView: View {
    @State var showGreeting: Bool
    @State var name: String
    @State var id: Int
    @EnvironmentObject var Api: Api
    @State var user: User
    @State private var filterByType = "entrée"
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting){
                if self.showGreeting{
                    NavigationLink(destination: CommandView(filterByType: $filterByType).environmentObject(Command(userId: self.user.user_id, isTakeAway: false))){
                        Text("\(self.user.first_name)")
                    }
                }else{
                    Text("\(self.user.first_name)")
                }

            }.toggleStyle(SwitchToggleStyle(tint: .green)).onChange(of: showGreeting){ value in
                Api.updateBokking(bookingId: id, isClientOnPlace: value)
                print(self.showGreeting)
            }
        }
    }
}

struct ToggleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButtonView(showGreeting: false, name: "test", id: 1, user: User(user_id: 1, role: "waiter", first_name: "test", last_name: "test", email: "test@gmail.com"))
    }
}

