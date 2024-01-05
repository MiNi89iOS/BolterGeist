//
//  MaterialThickness.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct MaterialThkTextFieldView: View {
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    
    var body: some View {
        VStack(spacing: -20) {
                Text("Material Thickness")
                    .font(.system(size: 16, weight: .bold))
                
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.purple)
                            .frame(width: 50, height: 25)
                            .opacity(0.6)
                        Group {
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .frame(width: 2, height: 35)
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .frame(width: 2, height: 10)
                                .rotationEffect(.degrees(-45))
                                .offset(x: 0, y: -12.5)
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .frame(width: 2, height: 10)
                                .rotationEffect(.degrees(-45))
                                .offset(x: 0, y: 12.5)
                        }
                        .offset(x: 0)
                    }
                    .offset(x: 10)
                    
                    Group {
                        TextField("10", text: $matThkTextFieldData.matThkTextFieldValue)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onChange(of: matThkTextFieldData.matThkTextFieldValue) {
                                var filtered = matThkTextFieldData.matThkTextFieldValue.filter { "0123456789.".contains($0) }
                                
                                if filtered.first == "0" {
                                    filtered = String(filtered.dropFirst())
                                }
                                
                                let components = filtered.components(separatedBy: ".")
                                if components.count > 1 {
                                    filtered = components[0] + "." + String(components[1].prefix(1))
                                }
                                
                                // Limit the number to 500
                                if let number = Double(filtered), number > Double(matThkTextFieldData.matThkMax) {
                                    filtered = String(matThkTextFieldData.matThkMax)
                                }
                                
                                // Update the text field value
                                self.matThkTextFieldData.matThkTextFieldValue = filtered
                            }
                            .foregroundColor(.green)
                            .frame(width: 80)
                        
                        Text("mm")
                            .padding(.leading, -20)
                            .foregroundColor(.green)
                    }
                }
                .offset(x: -5, y: 15)
            }
            .frame(width: 175, height: 87)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1))
    }
}

