//
//  Settings.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var drawingScale: DrawingScale
    
    @State private var showingConfirmationAlert = false
    
    let boltLengthValues = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
    let boltTypeValues: [String] = ["DIN 931", "DIN 933"]
    let boltDiameterValue = [3, 4, 5, 6, 8, 10, 12, 16, 20, 24, 30]
    let washerCountValues = Array(1...10)
    let gradationValues: [String] = ["5mm", "10mm", "20mm"]
    let pFactorValues = Array(0...20)
    let drawingScaleValues = Array(1...15)
    
    var body: some View {
        VStack() {
            HStack {
                Text("Max. Bolt Length")
                Spacer()
                Picker("", selection: $diameterManager.boltLengthMax) {
                    ForEach(boltLengthValues, id: \.self) {
                        Text("\($0)mm")
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding(.horizontal)
            
            HStack {
                Text("Max. Material Thickness")
                Spacer()
                Picker("", selection: $matThkTextFieldData.matThkMax) {
                    ForEach(boltLengthValues, id: \.self) {
                        Text("\($0)mm")
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding(.horizontal)
            
            HStack {
                Text("Default Bolt Type")
                Spacer()
                Picker("", selection: $componentList.selectedBoltValue) {
                    ForEach(boltTypeValues, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Default Bolt Diameter")
                Spacer()
                Picker("", selection: $diameterManager.boltDiameterValue) {
                    ForEach(boltDiameterValue, id: \.self) {
                        Text("M\($0)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Max. No. of Washers")
                Spacer()
                Picker("", selection: $componentList.washerCount) {
                    ForEach(washerCountValues, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Max. No. of Nuts")
                Spacer()
                Picker("", selection: $componentList.nutCount) {
                    ForEach(washerCountValues, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Default Bolt Length Gradation")
                Spacer()
                Picker("", selection: $gradationState.selectedGradation) {
                            Text("5mm").tag(GradationState.Gradation.gradation_5mm)
                            Text("10mm").tag(GradationState.Gradation.gradation_10mm)
                            Text("20mm").tag(GradationState.Gradation.gradation_20mm)
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            HStack {
                Text("Permissible\nNo. of Pitches\nBehind the Nut")
                Spacer()
                Slider(value: Binding<Double>(
                           get: { Double(diameterManager.pFactor) },
                           set: { diameterManager.pFactor = Int($0) }
                       ),
                       in: 0...20,
                       step: 1
                   )
                    .padding(.horizontal)
                Spacer()
                Text("\(diameterManager.pFactor)")
            }
            .padding(.horizontal)
            
            HStack {
                Text("Default Drawing Scale")
                Spacer()
                Picker("", selection: $drawingScale.drawingScaleValue) {
                    ForEach(drawingScaleValues, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.horizontal)
            
            Button("Restore Defaults") {
                            showingConfirmationAlert = true
                        }
                        .alert(isPresented: $showingConfirmationAlert) {
                            Alert(
                                title: Text("Restore Defaults"),
                                message: Text("Are you sure you want to set all parameters to default?"),
                                primaryButton: .destructive(Text("Yes")) {
                                    diameterManager.restoreDefaults()
                                    gradationState.restoreDefaults()
                                    matThkTextFieldData.restoreDefaults()
                                    componentList.restoreDefaults()
                                    drawingScale.restoreDefaults()
                                },
                                secondaryButton: .cancel()
                            )
                        }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
