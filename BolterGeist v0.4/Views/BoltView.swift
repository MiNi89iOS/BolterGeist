//
//  BoltView.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct BoltView: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var threadEntry: ThreadEntryData
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var drawingScale: DrawingScale
    
    var body: some View {
        
        VStack {

           /* if componentList.selectedBolt == "DIN 931" {
                Text("\(componentList.selectedBolt ?? "")")
            } else if componentList.selectedBolt == "DIN 933" {
                Text("\(componentList.selectedBolt ?? "")")
            } */
            ScrollView {
                if componentList.selectedBolt == "DIN 931" {
                    BoltDIN931View()
                        .environmentObject(diameterManager)
                        .environmentObject(gradationState)
                        .environmentObject(componentList)
                        .environmentObject(matThkTextFieldData)
                        .environmentObject(threadEntry)
                        .environmentObject(drawingScale)
                        .animation(.default)
                } else if componentList.selectedBolt == "DIN 933" {
                    BoltDIN933View()
                        .environmentObject(diameterManager)
                        .environmentObject(gradationState)
                        .environmentObject(componentList)
                        .environmentObject(matThkTextFieldData)
                        .environmentObject(drawingScale)
                        .animation(.default)
                } else if componentList.selectedBolt == "DIN 7991" {
                    BoltDIN7991View()
                        .environmentObject(diameterManager)
                        .environmentObject(gradationState)
                        .environmentObject(componentList)
                        .environmentObject(matThkTextFieldData)
                        .environmentObject(drawingScale)
                        .animation(.default)
                }
            }
        }
    }
}

struct BoltDIN931View: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var threadEntry: ThreadEntryData
    @EnvironmentObject var drawingScale: DrawingScale

    var body: some View {
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
            
            let boltLengthArray = boltLengthAssignement (
                gradation_5mm: gradationState.gradation_5mm,
                gradation_10mm: gradationState.gradation_10mm,
                gradation_20mm: gradationState.gradation_20mm,
                boltThread_L: boltThread_L,
                boltLengthMax: diameterManager.boltLengthMax
            )
            
            let matThk = Double(matThkTextFieldData.matThkTextFieldValue) ?? 0.0
            let thrEnt = Double(threadEntry.acceptableThreadEntry) ?? 0.0
        
            let drawingScale = Double(drawingScale.drawingScale)
            
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
            
            let washerDIN125 = washerDIN125 (
                washerDIN125_h: washerDIN125_h,
                washerDIN125_W: washerDIN125_D_Ext,
                drawScale: drawingScale
            )
            
            let washerDIN9021 = washerDIN9021 (
                washerDIN9021_h: washerDIN9021_h,
                washerDIN9021_W: washerDIN9021_D_Ext,
                drawScale: drawingScale
            )
            
            let nutDIN934 = nutDIN934 (
                nutDIN934_h: nutDIN934_h,
                nutDIN934_W: nutDIN934_W,
                drawScale: drawingScale
            )
            
            let nutDIN439 = nutDIN439 (
                nutDIN439_h: nutDIN439_h,
                nutDIN439_W: nutDIN439_W,
                drawScale: drawingScale
            )
            
            let combinedMaterial = combinedMaterial (
                materialThick: matThk, materialWidth: .infinity,
                drawScale: drawingScale
            )
            
            let boltDIN931 = boltDIN931 (
                boltDiameter: Double(diameterManager.boltDiameter),
                DIN931Head_h: DIN931Head_h,
                DIN931Head_W: DIN931Head_W,
                DIN931_L: Double(boltLengthResult),
                DIN931Thread_L: boltThreadLength(boltLength: boltLength[i], boltThread_L: boltThread_L),
                drawScale: drawingScale
            )
            
            let boltDIN931ThreadBorder = boltDIN931ThreadBorder(boltDiameter: Double(diameterManager.boltDiameter), drawScale: drawingScale)
        
            let shapeTopOffset: Double = 0
        
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        boltDIN931
                            .position (
                                x: geometry.size.width/2,
                                y: ((Double(boltLengthResult) + DIN931Head_h) / 2) * drawingScale + shapeTopOffset
                            )
                        
                        // Podkładki DIN 125 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Head, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Head) / 2 + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 9021 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Head, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Head) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Łączone materiały
                        ZStack {
                            combinedMaterial
                                .position (
                                    x: geometry.size.width/2,
                                    y: (matThk / 2
                                        + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                        + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                        + DIN931Head_h) * drawingScale + shapeTopOffset
                                )
                        }
                        
                        // Podkładki DIN 9021 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Nut, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut) / 2
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 125 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Nut, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Nut) / 2
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 934
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN934Count, id: \.self) { _ in
                                nutDIN934
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN934_h * Double(componentList.nutDIN934Count) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 439
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN439Count, id: \.self) { _ in
                                nutDIN439
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN439_h * Double(componentList.nutDIN439Count) / 2
                                + nutDIN934_h * Double(componentList.nutDIN934Count)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        boltDIN931ThreadBorder // czerwona linia na granicy gwintowanej części trzpienia
                            .position (
                                x: geometry.size.width/2,
                                y: (Double(boltLengthResult) + DIN931Head_h - boltThreadLength(boltLength: boltLength[i], boltThread_L: boltThread_L)) * drawingScale
                            )
                    }
                }
                
                Rectangle()
                    .frame(height: 0)
                    .foregroundColor(Color.black)
                    .padding(.top, (Double(boltLengthResult) + DIN931Head_h) * drawingScale)
            }
    }
}

let borderWidth: Double = 0.5

// Długość gwintu
func boltThreadLength(boltLength: Int, boltThread_L: [Int]) -> Double {
    var drawBoltThreadLength: Double = 0
    if boltLength <= 125 {
        drawBoltThreadLength = Double(boltThread_L[0])
    } else if boltLength > 125 && boltLength <= 200 {
        drawBoltThreadLength = Double(boltThread_L[1])
    } else if boltLength > 200 {
        drawBoltThreadLength = Double(boltThread_L[2])
    }
    return drawBoltThreadLength
}
// Rysunek Śruby DIN931
func boltDIN931(boltDiameter: Double, DIN931Head_h: Double, DIN931Head_W: Double, DIN931_L: Double, DIN931Thread_L: Double, drawScale: Double) -> some View {
    let colorGray_01 = Color(red: 120 / 255, green: 126 / 255, blue: 125 / 255)
    let colorGray_02 = Color(red: 150 / 255, green: 156 / 255, blue: 155 / 255)
        return VStack (spacing: 0) {
            ZStack {
                Rectangle()
                    .frame(width: DIN931Head_W * drawScale, height: DIN931Head_h * drawScale)
                    .foregroundColor(Color(red: 150 / 255, green: 156 / 255, blue: 155 / 255))
                    .border(.black, width: borderWidth)
                Rectangle()
                    .frame(width: DIN931Head_W/2 * drawScale, height: DIN931Head_h * drawScale)
                    .foregroundColor(Color(red: 165 / 255, green: 171 / 255, blue: 170 / 255))
                    .border(.black, width: borderWidth)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: boltDiameter * drawScale, height: DIN931_L * drawScale)
                    .foregroundColor(Color(red: 150 / 255, green: 156 / 255, blue: 155 / 255))
                    .border(.black, width: borderWidth)
                Rectangle()
                    .frame(width: boltDiameter * drawScale, height: DIN931Thread_L * drawScale)
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [colorGray_01, colorGray_02]), startPoint: .topLeading, endPoint: .trailing)
                    )
                    .border(.black, width: borderWidth)
                    .offset(y: DIN931_L/2 * drawScale - DIN931Thread_L/2 * drawScale)
            }
        }
}

// Rysunek Śruby DIN933
func boltDIN933 (
    boltDiameter: Double,
    DIN931Head_h: Double,
    DIN931Head_W: Double,
    DIN931_L: Double,
    drawScale: Double
) -> some View {
    
        return VStack (spacing: 0) {
            ZStack {
                Rectangle()
                    .frame(width: DIN931Head_W * drawScale, height: DIN931Head_h * drawScale)
                    .foregroundColor(Color(red: 150 / 255, green: 156 / 255, blue: 155 / 255))
                    .border(.black, width: borderWidth)
                Rectangle()
                    .frame(width: DIN931Head_W/2 * drawScale, height: DIN931Head_h * drawScale)
                    .foregroundColor(Color(red: 165 / 255, green: 171 / 255, blue: 170 / 255))
                    .border(.black, width: borderWidth)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: boltDiameter * drawScale, height: DIN931_L * drawScale)
                    .foregroundColor(.gray)
                    .border(.black, width: borderWidth)
            }
        }
}

func boltDIN931ThreadBorder (
    boltDiameter: Double,
    drawScale: Double
    ) -> some View {
        
    Rectangle()
        .frame(width: boltDiameter * drawScale, height: 0.2 * drawScale)
        .foregroundColor(.red)
        .border(.red, width: borderWidth)
        .opacity(resultSumOfComponents_02 ? 1.0 : 0.0)
}

// Rysunek podkładki DIN125
func washerDIN125(washerDIN125_h: Double, washerDIN125_W: Double, drawScale: Double) -> some View {
    Rectangle()
        .frame(width: washerDIN125_W * drawScale, height: washerDIN125_h * drawScale)
        .opacity(0.75)
        .foregroundColor(.blue)
        .border(.black, width: borderWidth)
    }

// Rysunek podkładki DIN9021
func washerDIN9021(washerDIN9021_h: Double, washerDIN9021_W: Double, drawScale: Double) -> some View {
    Rectangle()
        .frame(width: washerDIN9021_W * drawScale, height: washerDIN9021_h * drawScale)
        .opacity(0.75)
        .foregroundColor(.green)
        .border(.black, width: borderWidth)
}

// Rysunek nakrętki DIN 934
func nutDIN934(nutDIN934_h: Double, nutDIN934_W: Double, drawScale: Double) -> some View {
        ZStack {
            Rectangle()
                .frame(width: nutDIN934_W * drawScale, height: nutDIN934_h * drawScale)
                .foregroundColor(.orange)
                .border(.black, width: borderWidth)
            Rectangle()
                .frame(width: nutDIN934_W/2 * drawScale, height: nutDIN934_h * drawScale)
                .foregroundColor(Color(red: 250 / 255, green: 180 / 255, blue: 50 / 255))
                .border(.black, width: borderWidth)
        }
        .opacity(0.8)
    }

// Rysunek nakrętki DIN 439
func nutDIN439(nutDIN439_h: Double, nutDIN439_W: Double, drawScale: Double) -> some View {
    ZStack {
        Rectangle()
            .frame(width: nutDIN439_W * drawScale, height: nutDIN439_h * drawScale)
            .foregroundColor(Color.mint)
            .border(.black, width: borderWidth)
        Rectangle()
            .frame(width: nutDIN439_W/2 * drawScale, height: nutDIN439_h * drawScale)
            .foregroundColor(Color(red: 75 / 255, green: 210 / 255, blue: 200 / 255))
            .border(.black, width: borderWidth)
    }
    .opacity(0.8)
}

// Rysunek łączonych elementów
func combinedMaterial(materialThick: Double, materialWidth: Double, drawScale: Double) -> some View {
        Rectangle()
            .frame(width: materialWidth * drawScale, height: materialThick * drawScale)
            .opacity(0.6)
            .border(.black, width: borderWidth)
            .foregroundColor(.purple)
}

struct BoltDIN933View: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var drawingScale: DrawingScale

    var body: some View {
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
            
            let washerDIN125 = washerDIN125 (
                washerDIN125_h: washerDIN125_h,
                washerDIN125_W: washerDIN125_D_Ext,
                drawScale: drawingScale
            )
            
            let washerDIN9021 = washerDIN9021 (
                washerDIN9021_h: washerDIN9021_h,
                washerDIN9021_W: washerDIN9021_D_Ext,
                drawScale: drawingScale
            )
            
            let nutDIN934 = nutDIN934 (
                nutDIN934_h: nutDIN934_h,
                nutDIN934_W: nutDIN934_W,
                drawScale: drawingScale
            )
            
            let nutDIN439 = nutDIN439 (
                nutDIN439_h: nutDIN439_h,
                nutDIN439_W: nutDIN439_W,
                drawScale: drawingScale
            )
            
            let combinedMaterial = combinedMaterial (
                materialThick: matThk, materialWidth: .infinity,
                drawScale: drawingScale
            )
            
            let boltDIN933 = boltDIN933 (
                boltDiameter: Double(diameterManager.boltDiameter),
                DIN931Head_h: DIN931Head_h,
                DIN931Head_W: DIN931Head_W,
                DIN931_L: Double(boltLengthResult),
                drawScale: drawingScale
            )
        
            let shapeTopOffset: Double = 0
        
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        boltDIN933
                            .position (
                                x: geometry.size.width/2,
                                y: ((Double(boltLengthResult) + DIN931Head_h) / 2) * drawingScale + shapeTopOffset
                            )
                        
                        // Podkładki DIN 125 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Head, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Head) / 2 + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 9021 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Head, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Head) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Łączone materiały
                        ZStack {
                            combinedMaterial
                                .position (
                                    x: geometry.size.width/2,
                                    y: (matThk / 2
                                        + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                        + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                        + DIN931Head_h) * drawingScale + shapeTopOffset
                                )
                        }
                        
                        // Podkładki DIN 9021 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Nut, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut) / 2
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 125 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Nut, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Nut) / 2
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 934
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN934Count, id: \.self) { _ in
                                nutDIN934
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN934_h * Double(componentList.nutDIN934Count) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 439
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN439Count, id: \.self) { _ in
                                nutDIN439
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN439_h * Double(componentList.nutDIN439Count) / 2
                                + nutDIN934_h * Double(componentList.nutDIN934Count)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                    }
                }
                
                Rectangle()
                    .frame(height: 0)
                    .foregroundColor(Color.black)
                    .padding(.top, (Double(boltLengthResult) + DIN931Head_h) * drawingScale)
            }
    }
}

struct BoltDIN7991View: View {
    @EnvironmentObject var diameterManager: BoltDiameter
    @EnvironmentObject var gradationState: GradationState
    @EnvironmentObject var componentList: ComponentList
    @EnvironmentObject var matThkTextFieldData: MaterialThkTextFieldData
    @EnvironmentObject var drawingScale: DrawingScale

    var body: some View {
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
            
            let washerDIN125 = washerDIN125 (
                washerDIN125_h: washerDIN125_h,
                washerDIN125_W: washerDIN125_D_Ext,
                drawScale: drawingScale
            )
            
            let washerDIN9021 = washerDIN9021 (
                washerDIN9021_h: washerDIN9021_h,
                washerDIN9021_W: washerDIN9021_D_Ext,
                drawScale: drawingScale
            )
            
            let nutDIN934 = nutDIN934 (
                nutDIN934_h: nutDIN934_h,
                nutDIN934_W: nutDIN934_W,
                drawScale: drawingScale
            )
            
            let nutDIN439 = nutDIN439 (
                nutDIN439_h: nutDIN439_h,
                nutDIN439_W: nutDIN439_W,
                drawScale: drawingScale
            )
            
            let combinedMaterial = combinedMaterial (
                materialThick: matThk, materialWidth: .infinity,
                drawScale: drawingScale
            )
            
            let boltDIN933 = boltDIN933 (
                boltDiameter: Double(diameterManager.boltDiameter),
                DIN931Head_h: DIN931Head_h,
                DIN931Head_W: DIN931Head_W,
                DIN931_L: Double(boltLengthResult),
                drawScale: drawingScale
            )
        
            let shapeTopOffset: Double = 0
        
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        boltDIN933
                            .position (
                                x: geometry.size.width/2,
                                y: ((Double(boltLengthResult) + DIN931Head_h) / 2) * drawingScale + shapeTopOffset
                            )
                        
                        // Podkładki DIN 125 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Head, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Head) / 2 + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 9021 pod łbem śruby
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Head, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Head) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Łączone materiały
                        ZStack {
                            combinedMaterial
                                .position (
                                    x: geometry.size.width/2,
                                    y: (matThk / 2
                                        + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                        + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                        + DIN931Head_h) * drawingScale + shapeTopOffset
                                )
                        }
                        
                        // Podkładki DIN 9021 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN9021Count_Nut, id: \.self) { _ in
                                washerDIN9021
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut) / 2
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Podkładki DIN 125 pod nakrętką
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.washerDIN125Count_Nut, id: \.self) { _ in
                                washerDIN125
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (washerDIN125_h * Double(componentList.washerDIN125Count_Nut) / 2
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 934
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN934Count, id: \.self) { _ in
                                nutDIN934
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN934_h * Double(componentList.nutDIN934Count) / 2
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                        
                        // Nakrętki DIN 439
                        VStack (spacing: 0) {
                            ForEach(0..<componentList.nutDIN439Count, id: \.self) { _ in
                                nutDIN439
                            }
                        }
                        .position (
                            x: geometry.size.width/2,
                            y: (nutDIN439_h * Double(componentList.nutDIN439Count) / 2
                                + nutDIN934_h * Double(componentList.nutDIN934Count)
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Nut)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Nut)
                                + matThk
                                + washerDIN125_h * Double(componentList.washerDIN125Count_Head)
                                + washerDIN9021_h * Double(componentList.washerDIN9021Count_Head)
                                + DIN931Head_h) * drawingScale + shapeTopOffset
                        )
                    }
                }
                
                Rectangle()
                    .frame(height: 0)
                    .foregroundColor(Color.black)
                    .padding(.top, (Double(boltLengthResult) + DIN931Head_h) * drawingScale)
            }
    }
}

#Preview {
    ContentView()
}
