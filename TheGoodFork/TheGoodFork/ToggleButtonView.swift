//
//  ToggleButtonView.swift
//  TheGoodFork
//
//  Created by admin on 07/06/2021.
//

import SwiftUI
import UIKit

struct ToggleButtonView: View {
    @State private var showGreeting = false
    @State var name: String
    @State var id: Int
    @EnvironmentObject var Api: Api
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting){
                Text("\(self.name)")
            }.toggleStyle(SwitchToggleStyle(tint: .green)).onChange(of: showGreeting){ value in
                Api.updateBokking(bookingId: id, isClientOnPlace: value)
            }
        }
    }
}

struct ToggleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButtonView(name: "test", id: 1)
    }
}

