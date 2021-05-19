//
//  ReservationView.swift
//  TheGoodFork
//
//  Created by admin on 19/05/2021.
//

import SwiftUI
import UIKit

struct ReservationView: View {
    
    @State private var name: String = ""
    
    @State private var numOfPeople = "0"
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
   
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @State private var date = Date()
    
    var body: some View {
        ScrollView{
            HStack (alignment: .center, spacing: 10) {
                Image("logo-white")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            Text("Réservation").font(.headline)
            VStack (spacing: 15){
                HStack{
                    Text("Nom : ")
                    TextField("Nom", text : $name)
                        .cornerRadius(3.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                VStack {
                    DatePicker("Date : ", selection: $date, in: Date()..., displayedComponents: .date).environment(\.locale, Locale.init(identifier: "fr"))
                }
                VStack {
                    DatePicker("Heure : ", selection: $date, displayedComponents: .hourAndMinute).environment(\.locale, Locale.init(identifier: "fr"))
                }
                VStack(alignment: .leading, spacing: 10){
                    Text("Nombre de personnes : ")
                    TextField("0", text: $numOfPeople)
                        .keyboardType(.numberPad)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }.padding(.horizontal,  30)
            
            Button(action: {
                print("Bom: \(self.name) date: \(self.date) personnes: \(self.numOfPeople)")
            }){
                HStack{
                    Spacer()
                    Text("Réserver").font(.headline).foregroundColor(.white)
                    Spacer()
                }.padding(.vertical, 10)
                .background(Color.blue).cornerRadius(5.0).padding(.horizontal,  40)
            }

            
        }
        
        
    }
   
    
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
