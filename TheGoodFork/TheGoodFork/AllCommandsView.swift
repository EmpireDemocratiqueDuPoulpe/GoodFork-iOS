//
//  AllCommandsView.swift
//  TheGoodFork
//
//  Created by admin on 09/06/2021.
//


import SwiftUI
import UIKit

struct AllCommandsView: View {
    @EnvironmentObject var Api: Api
    
    func dayDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ScrollView{
            ForEach(Api.orders, id: \.order_id) { order in
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(order.user.first_name)")
                        Text("n°\(order.order_id) (\(order.is_take_away != 0 ? "A emporter" : "Sur place"))")
                    }
                    Spacer()
                    if (order.is_finished != 0) {
                        Text("Terminée").foregroundColor(.green)
                    }else{
                        Text("En cours").foregroundColor(.orange)
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }.padding(.horizontal, 20)
        }.navigationTitle("Commandes du \(self.dayDate())")
    }
}

struct AllCommandsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCommandsView()
    }
}
