//
//  GradationView.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct GradationView: View {
    @EnvironmentObject private var gradationState: GradationState
    @State private var gradationLastTappedButton: Int?
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                GradationToggleButton(action: {
                    if gradationLastTappedButton != 1 {
                        gradationState.gradation_5mm = true
                        gradationState.gradation_10mm = false
                        gradationState.gradation_20mm = false
                        gradationLastTappedButton = 1
                    }
                }, label: "5mm", isActive: gradationState.gradation_5mm)
            }
            
            HStack {
                GradationToggleButton(action: {
                    if gradationLastTappedButton != 2 {
                        gradationState.gradation_5mm = false
                        gradationState.gradation_10mm = true
                        gradationState.gradation_20mm = false
                        gradationLastTappedButton = 2
                    }
                }, label: "10mm", isActive: gradationState.gradation_10mm)
            }
            
            HStack {
                GradationToggleButton(action: {
                    if gradationLastTappedButton != 3 {
                        gradationState.gradation_5mm = false
                        gradationState.gradation_10mm = false
                        gradationState.gradation_20mm = true
                        gradationLastTappedButton = 3
                    }
                }, label: "20mm", isActive: gradationState.gradation_20mm)
            }
            
            Text("Bolt Length\nGradation")
                .font(.system(size: 20))
                .rotationEffect(.degrees(-90))
                .frame(width: 110, height: 120)
        }
        .frame(width: 80, height: 298)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1))
    }
}

struct GradationToggleButton: View {
   
    var action: () -> Void
    var label: String
    var isActive: Bool
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 0, height: 0)
                    .opacity(0.0)
                
                Ellipse()
                    .foregroundColor(isActive ? Color.green : Color.blue)
                    .frame(width: isActive ? 65 : 60, height: isActive ? 45 : 40)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .overlay(
                        Text(label)
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                    .shadow(color: isActive ? Color.green.opacity(0.3) : Color.clear, radius: 20, x: 0, y: 0)
                
            }
        }
        .padding(5)
    }
}
