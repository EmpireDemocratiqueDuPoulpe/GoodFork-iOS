//
//  PlatCellView.swift
//  TheGoodFork
//
//  Created by admin on 10/05/2021.
//

import SwiftUI
import UIKit


struct PlatCellView: View {

    
    var body: some View {
            HStack{
                Image("logo-white").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60)
                Spacer()
                Text("Pizza")
                Spacer()
                Text("10€")
                    .font(.body)
                    .bold()
            }.padding([.top, .horizontal])
            .background(Color(.secondarySystemBackground))
            .foregroundColor(Color(.label))
}
    }
struct PlatCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlatCellView()
    }
}


