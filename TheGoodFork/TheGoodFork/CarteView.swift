//
//  CarteView.swift
//  TheGoodFork
//
//  Created by admin on 08/05/2021.
//

import SwiftUI
import UIKit


struct CarteView: View {
    
    var body: some View {
            HStack (alignment: .center, spacing: 10) {
                Spacer()
                Image("logo-white")
                    .resizable()
                    .frame(width: 150, height: 150)
                Spacer()
            }
        }
}

struct CarteView_Previews: PreviewProvider {
    static var previews: some View {
        CarteView()
    }
}

