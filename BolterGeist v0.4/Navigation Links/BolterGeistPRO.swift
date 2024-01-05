//
//  BolterGeistPRO.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct BolterGeistPro: View {
    
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var threadEntry: ThreadEntryData
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var drawingScale: DrawingScale
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                ScrollView {
                    VStack {
                        // 1
                        BoltView()
                            .environmentObject(diameterManager)
                            .environmentObject(gradationState)
                            .environmentObject(matThkTextFieldData)
                            .environmentObject(threadEntry)
                            .environmentObject(componentList)
                            .environmentObject(drawingScale)
                            .padding()
                            .frame(height: geometry.size.height * 0.40)
                            .offset(y: -35)
                        
                        Group {
                            // 3
                            ResultView()
                                .environmentObject(diameterManager)
                                .environmentObject(gradationState)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(threadEntry)
                                .environmentObject(componentList)
                                .environmentObject(drawingScale)
                                .offset(y: 5)
                            
                            // 3
                            HStack {
                                DrawingScaleTextField_Picker()
                                    .environmentObject(drawingScale)
                                    .frame(width: 50, height: 20)
                                    .offset(x: -25, y: 0)
                                    .scaleEffect(0.8)
                                
                                Spacer()
                                
                                MaterialThkTextFieldView()
                                    .environmentObject(matThkTextFieldData)
                                    .offset(x: 10)
                                    .scaleEffect(0.8)
                                
                                Spacer()
                                
                                PickerView()
                                    .environmentObject(diameterManager)
                                    .scaleEffect(0.8)
                                    .offset(x: 0)
                            }
                            .offset(x: 25, y: 25)
                            // 4
                            ZStack(alignment: .top) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        if componentList.selectedBolt == "DIN 931" {
                                            ThreadEntryView()
                                                .environmentObject(threadEntry)
                                                .scaleEffect(0.8)
                                                .frame(width: 185, height: 100)
                                                .offset(x: -14.5, y: 0)
                                        }
                                        
                                        GradationView()
                                            .environmentObject(gradationState)
                                            .frame(width: 60, height: 239)
                                            .scaleEffect(0.8)
                                    }
                                    Spacer()
                                }
                                ComponentListView()
                                    .environmentObject(componentList)
                            }
                        }
                        .offset(y:-60)
                    }
                    .padding()
                }
            } else {
                HStack (alignment: .top, spacing: -40) {
                    VStack (alignment: .leading) {
                        HStack(alignment: .top) {
                            GradationView()
                                .environmentObject(gradationState)
                                .frame(width: 60, height: 239)
                                .scaleEffect(0.8)
                            VStack (alignment: .leading) {
                                ThreadEntryView()
                                    .environmentObject(threadEntry)
                                    .scaleEffect(0.8)
                                    .frame(width: 185, height: 100)
                                    .offset(x: -14.5, y: 0)
                                MaterialThkTextFieldView()
                                    .environmentObject(matThkTextFieldData)
                                    .offset(x: 0)
                                    .scaleEffect(0.8)
                            }
                        }
                        HStack {
                            DrawingScaleTextField_Picker()
                                .environmentObject(drawingScale)
                                .frame(width: 50, height: 20)
                                .offset(x: 6, y: 10)
                                .scaleEffect(0.8)
                            ResultView()
                                .environmentObject(diameterManager)
                                .environmentObject(gradationState)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(threadEntry)
                                .environmentObject(componentList)
                                .environmentObject(drawingScale)
                                .offset(x: 10, y: 15)
                        }
                    }
                    VStack {
                        BoltView()
                            .environmentObject(diameterManager)
                            .environmentObject(gradationState)
                            .environmentObject(matThkTextFieldData)
                            .environmentObject(threadEntry)
                            .environmentObject(componentList)
                            .environmentObject(drawingScale)
                            .padding()
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        ComponentListView()
                            .environmentObject(componentList)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
