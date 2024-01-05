//
//  M_Picker.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct PickerView: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    let boltDiameterValues = [3, 4, 5, 6, 8, 10, 12, 16, 20, 24, 30]
    
    var body: some View {
        Picker("Choose a value", selection: $diameterManager.boltDiameter) {
            ForEach(boltDiameterValues, id: \.self) {
                Text("M\($0)")
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1))
        .clipped()
        .pickerStyle(WheelPickerStyle())
        .padding()
        .frame(width: 100, height: 120)
        
    }
}

