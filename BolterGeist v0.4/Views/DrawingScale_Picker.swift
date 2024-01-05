//
//  DrawingScale_Picker.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct DrawingScaleTextField_Picker: View {
    @EnvironmentObject var drawingScale: DrawingScale
    let drawingScaleValues = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    var body: some View {
        VStack(spacing: -15) {
            Text("Drawing")
                .font(.headline)
                .offset(y: 7)
            
            Picker("Choose Scale", selection: $drawingScale.drawingScale) {
                ForEach(drawingScaleValues, id: \.self) {
                    Text("\($0)")
                }
            }
            .clipped()
            .pickerStyle(WheelPickerStyle())
            .padding()
            .frame(width: 100, height: 80)
            
            Text("Scale")
                .font(.headline)
                .offset(y: -7)
        }
        .frame(width: 80, height: 87)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1))
       
        
    }
}

