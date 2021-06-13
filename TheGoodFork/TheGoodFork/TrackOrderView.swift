//
//  TrackOrderView.swift
//  TheGoodFork
//
//  Created by admin on 09/06/2021.
//


import SwiftUI
import UIKit

struct TrackOrderView: View {
    @EnvironmentObject var Api: Api
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Section(header: Text("Entrées").font(.headline)) {
                    ForEach(Array(Api.viewOrder.filter({ $0.type == "entrée"})), id: \.menu_id) { value in
                            HStack{
                                if (value.is_finished != 0) {
                                    Text("\(value.name)").foregroundColor(.green)
                                }else{
                                    Text("\(value.name)").foregroundColor(.orange)
                                }
                                Spacer()
                                Text("\(String(format: "%.2f", value.price))€")
                            }
                        }
                    }
                Section(header: Text("Plats").font(.headline)) {
                    ForEach(Array(Api.viewOrder.filter({ $0.type == "plat"})), id: \.menu_id) { value in
                            HStack{
                                if (value.is_finished != 0) {
                                    Text("\(value.name)").foregroundColor(.green)
                                }else{
                                    Text("\(value.name)").foregroundColor(.orange)
                                }
                                Spacer()
                                Text("\(String(format: "%.2f", value.price))€")
                            }
                        }
                    }
                Section(header: Text("Desserts").font(.headline)) {
                    ForEach(Array(Api.viewOrder.filter({ $0.type == "dessert"})), id: \.menu_id) { value in
                            HStack{
                                if (value.is_finished != 0) {
                                    Text("\(value.name)").foregroundColor(.green)
                                }else{
                                    Text("\(value.name)").foregroundColor(.orange)
                                }
                                Spacer()
                                Text("\(String(format: "%.2f", value.price))€")
                            }
                        }
                    }

                if Api.pay{
                    Button(action: {
                        Api.payCommand(booking_id: Api.currentBookingId)
                    }){
                        HStack{
                            Spacer()
                            Text("Payer").font(.system(size: 20)).foregroundColor(Color("DarkerPrimaryLight"))
                            Spacer()
                        }.padding(.vertical, 15)
                        .background(Color("Secondary"))
                }
                    
                }
            }.padding(.horizontal,  10)
        }.navigationTitle("Suivi de commande")
}
}

struct TrackOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TrackOrderView()
    }
}
