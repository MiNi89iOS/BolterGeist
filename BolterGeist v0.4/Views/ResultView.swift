//
//  ResultView.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var threadEntry: ThreadEntryData
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var drawingScale: DrawingScale
    
    var body: some View {
        let bolt_Dia = diameterManager.boltDiameter
        
        VStack {
            if componentList.selectedBolt == "DIN 931" {
                let (
                    DIN931Head_h,
                    DIN931Head_W,
                    boltThread_L,
                    washerDIN125_h,
                    washerDIN125_D_Ext,
                    washerDIN9021_h,
                    washerDIN9021_D_Ext,
                    nutDIN934_h,
                    nutDIN934_W,
                    nutDIN439_h,
                    nutDIN439_W,
                    boltThread_p
                ) = valueAssignement(bolt_D: bolt_Dia)
                
                let boltLengthArray = boltLengthAssignement (
                    gradation_5mm: gradationState.gradation_5mm,
                    gradation_10mm: gradationState.gradation_10mm,
                    gradation_20mm: gradationState.gradation_20mm,
                    boltThread_L: boltThread_L,
                    boltLengthMax: diameterManager.boltLengthMax
                )
                
                let matThk = Double(matThkTextFieldData.matThkTextFieldValue) ?? 0.0
                let thrEnt = Double(threadEntry.acceptableThreadEntry) ?? 0.0
                let drawingScale = Double(drawingScale.drawingScale) ?? 0.0
                
                let boltLengthResult = boltLengthCalc (
                    boltThread_L: boltThread_L,
                    washerDIN125_h: washerDIN125_h,
                    washerDIN9021_h: washerDIN9021_h,
                    nutDIN934_h: nutDIN934_h,
                    nutDIN439_h: nutDIN439_h,
                    boltThread_p: boltThread_p,
                    headWasherDIN125Count: componentList.washerDIN125Count_Head,
                    headWasherDIN9021Count: componentList.washerDIN9021Count_Head,
                    nutWasherDIN125Count: componentList.washerDIN125Count_Nut,
                    nutWasherDIN9021Count: componentList.washerDIN9021Count_Nut,
                    nutDIN934Count: componentList.nutDIN934Count,
                    nutDIN439Count: componentList.nutDIN439Count,
                    thicknessOfElements: matThk,
                    threadEntry: threadEntry.threadEntry,
                    acceptableThreadEntry: thrEnt,
                    threadEntryAbsolute: threadEntry.threadEntryAbsolute,
                    thread_pFactor: diameterManager.pFactor
                )
                
                let sumOfNutsCheck = sumOfNutsCheck (
                    boltThread_L: boltThread_L,
                    nutDIN934_h: nutDIN934_h,
                    nutDIN439_h: nutDIN439_h,
                    nutDIN934Count: componentList.nutDIN934Count,
                    nutDIN439Count: componentList.nutDIN439Count
                )
                
                let resultSummary = boltResult (
                    washerDIN125_h: washerDIN125_h,
                    washerDIN9021_h: washerDIN9021_h,
                    bolt_D: bolt_Dia,
                    threadEntry: threadEntry.threadEntry,
                    acceptableThreadEntry: thrEnt,
                    nutWasherDIN125Count: componentList.washerDIN125Count_Nut,
                    nutWasherDIN9021Count: componentList.washerDIN9021Count_Nut,
                    nutDIN934Count: componentList.nutDIN934Count,
                    nutDIN439Count: componentList.nutDIN439Count
                )
                
                
                
                GeometryReader { geometry in
                    Text(resultSummary)
                        .font(.system(size: 15))
                        .frame(width: geometry.size.width, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1)
                            .shadow(color: resultOverlayColor () ? .green : .red, radius: 2))
                }
            } else if componentList.selectedBolt == "DIN 933" {
                let bolt_Dia = diameterManager.boltDiameter
            
                let (
                    DIN931Head_h,
                    DIN931Head_W,
                    boltThread_L,
                    washerDIN125_h,
                    washerDIN125_D_Ext,
                    washerDIN9021_h,
                    washerDIN9021_D_Ext,
                    nutDIN934_h,
                    nutDIN934_W,
                    nutDIN439_h,
                    nutDIN439_W,
                    boltThread_p
                ) = valueAssignement(bolt_D: bolt_Dia)
                
                let boltLengthArray = boltLengthDIN933Assignement (
                    gradation_5mm: gradationState.gradation_5mm,
                    gradation_10mm: gradationState.gradation_10mm,
                    gradation_20mm: gradationState.gradation_20mm,
                    boltLengthMax: diameterManager.boltLengthMax
                )
                
                let matThk = Double(matThkTextFieldData.matThkTextFieldValue) ?? 0.0
            
                let drawingScale = Double(drawingScale.drawingScale)
                
                let boltLengthResult = boltDIN933LengthCalc (
                    washerDIN125_h: washerDIN125_h,
                    washerDIN9021_h: washerDIN9021_h,
                    nutDIN934_h: nutDIN934_h,
                    nutDIN439_h: nutDIN439_h,
                    boltThread_p: boltThread_p,
                    headWasherDIN125Count: componentList.washerDIN125Count_Head,
                    headWasherDIN9021Count: componentList.washerDIN9021Count_Head,
                    nutWasherDIN125Count: componentList.washerDIN125Count_Nut,
                    nutWasherDIN9021Count: componentList.washerDIN9021Count_Nut,
                    nutDIN934Count: componentList.nutDIN934Count,
                    nutDIN439Count: componentList.nutDIN439Count,
                    thicknessOfElements: matThk,
                    thread_pFactor: diameterManager.pFactor
                )
            
                let resultSummary = boltDIN933Result (
                    bolt_D: bolt_Dia,
                    nutDIN934Count: componentList.nutDIN934Count,
                    nutDIN439Count: componentList.nutDIN439Count
                )
                
                GeometryReader { geometry in
                    Text(resultSummary)
                        .font(.system(size: 15))
                        .frame(width: geometry.size.width, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1)
                            .shadow(color: resultOverlayColor () ? .green : .red, radius: 2))
                }
            }
        }
    }
    
    func resultOverlayColor () -> Bool {
        if isOKValue == true {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    ContentView()
}

