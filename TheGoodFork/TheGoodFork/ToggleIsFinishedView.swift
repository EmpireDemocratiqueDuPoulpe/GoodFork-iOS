//
//  ToggleIsFinishedView.swift
//  TheGoodFork
//
//  Created by admin on 11/06/2021.
//

import SwiftUI
import UIKit

struct ToggleIsFinishedView: View {
    @State var showGreeting: Bool
    @State var id: Int
    @EnvironmentObject var Api: Api

    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting){
                if self.showGreeting{
                        Text("Terminé")
                }else{
                    Text("En cours")
                }

            }.toggleStyle(SwitchToggleStyle(tint: .green)).onChange(of: showGreeting){ value in
                print(self.showGreeting)
            }
        }
    }
}

struct ToggleIsFinishedView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleIsFinishedView(showGreeting: false, id: 1)
    }
}

