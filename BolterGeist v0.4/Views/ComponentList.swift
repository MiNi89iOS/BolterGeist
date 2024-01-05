//
//  ComponentList.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct ComponentListView: View {
    @State private var isBoltListExpanded = false
    @State private var isWasherListExpanded = false
    @State private var isNutListExpanded = false
    
    @EnvironmentObject var componentList: ComponentList
    
    var body: some View {
        let boltDIN931_02 = boltDIN931 (
            boltDiameter: 10,
            DIN931Head_h: 10,
            DIN931Head_W: 20,
            DIN931_L: 35,
            DIN931Thread_L: 20,
            drawScale: 0.9
        )
        GeometryReader { geometry in
            VStack {
                // BOLTS
                HStack (alignment: .top) {
                    Spacer()
                    
                    Group {
                        if isBoltListExpanded {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(.systemBackground))
                                    )
                                    .frame(width: 110, height: 100)
                                
                                ScrollView {
                                    VStack(spacing: 0) {
                                        BoltRow(color: .green, label: "DIN 931", selectedBolt: $componentList.selectedBolt)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(7)
                                        
                                        BoltRow(color: .blue, label: "DIN 933", selectedBolt: $componentList.selectedBolt)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(7)
                                        
                                    }
                                }
                                .frame(width: 110, height: 100)
                                .clipped()
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255, opacity: 1))
                            .shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255, opacity: isBoltListExpanded ? 0.7 : 0.0), radius: 7)
                        
                        boltDIN931_02
                            .rotationEffect(.degrees(isBoltListExpanded ? 90 : 0))
                            .scaleEffect(CGSize (
                                width: isBoltListExpanded ? 0.9 : 1.0,
                                height: isBoltListExpanded ? 0.9 : 1.0)
                            )
                    }
                    .onTapGesture {
                        withAnimation {
                            self.isBoltListExpanded.toggle()
                        }
                    }
                }
                
                if isWasherListExpanded && !isBoltListExpanded {
                    Rectangle()
                        .frame(width: 50, height: 42)
                        .opacity(0)
                }
                
                // WASHERS
                HStack (alignment: .top) {
                    Spacer()
                    
                    Group {
                        if isWasherListExpanded {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(.systemBackground))
                                    )
                                    .frame(width: 210, height: 115)
                                
                                ScrollView {
                                    VStack(spacing: -40) {
                                        ComponentPickerTwoSides(color: .blue, label: "DIN 125", clickCount_Head: $componentList.washerDIN125Count_Head, clickCount_Nut: $componentList.washerDIN125Count_Nut, valuesMaxValue: componentList.washerCount, washerWidth: 20, scale: 1.2)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(EdgeInsets(top: -20, leading: 25, bottom: 0, trailing: 0))
                                        ComponentPickerTwoSides(color: .green, label: "DIN 9021", clickCount_Head: $componentList.washerDIN9021Count_Head, clickCount_Nut: $componentList.washerDIN9021Count_Nut, valuesMaxValue: componentList.washerCount, washerWidth: 13, scale: 1.2)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(EdgeInsets(top: 0, leading: 25, bottom: -10, trailing: 0))
                                    }
                                }
                                .frame(width: 210, height: 115)
                                .clipped()
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255, opacity: 1))
                            .shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255, opacity: isWasherListExpanded ? 0.7 : 0.0), radius: 7)
                        
                        Group {
                            Circle()
                                .frame(width: 45)
                                .foregroundColor(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1))
                            
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255, opacity: 1))
                        }
                        .scaleEffect(CGSize (
                            width: isWasherListExpanded ? 0.8 : 0.95,
                            height: isWasherListExpanded ? 0.8 : 0.95)
                        )
                        .rotation3DEffect(
                            .degrees(isWasherListExpanded ? -45 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        
                    }
                    .onTapGesture {
                        withAnimation {
                            self.isWasherListExpanded.toggle()
                        }
                    }
                }
                
                // NUTS
                HStack (alignment: .top) {
                    Spacer()
                    
                    Group {
                        if isNutListExpanded {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(.systemBackground))
                                    )
                                    .frame(width: 210, height: 115)
                                
                                ScrollView {
                                    VStack(spacing: -40) {
                                        ComponentPickerOneSide(color: .green, label: "DIN 934", clickCount: $componentList.nutDIN934Count, valuesMaxValue: componentList.nutCount)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(EdgeInsets(top: -20, leading: 25, bottom: 0, trailing: 0))
                                        ComponentPickerOneSide(color: .blue, label: "DIN 439", clickCount: $componentList.nutDIN439Count, valuesMaxValue: componentList.nutCount)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(EdgeInsets(top: 0, leading: 25, bottom: -10, trailing: 0))
                                    }
                                }
                                .frame(width: 210, height: 115)
                                .clipped()
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255, opacity: 1))
                            .shadow(color: Color(red: 200/255, green: 200/255, blue: 200/255, opacity: isNutListExpanded ? 0.7 : 0.0), radius: 7)
                        
                        Group {
                            Hexagon()
                                .padding(2)
                                .foregroundColor(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1))
                                .frame(width: 50, height: 50)
                            Circle()
                                .frame(width: 17)
                                .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255, opacity: 1))
                        }
                        .rotationEffect(.degrees(isNutListExpanded ? 270 : 0))
                        .scaleEffect(CGSize (
                            width: isNutListExpanded ? 0.8 : 1.0,
                            height: isNutListExpanded ? 0.8 : 1.0)
                        )
                        .rotation3DEffect(
                            .degrees(isNutListExpanded ? -45 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    }
                    .onTapGesture {
                        withAnimation {
                            self.isNutListExpanded.toggle()
                        }
                    }
                }
            }
        }
    }
    
    struct BoltRow: View {
        var color: Color
        var label: String
        
        @Binding var selectedBolt: String?
        
        var body: some View {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 20)
                    .foregroundColor(color)
                
                Text(label)
                    .font(.system(size: 13))
                Spacer()
            }
            .background(selectedBolt == label ? Color.green.opacity(0.3) : nil)
            .shadow(color: selectedBolt == label ? Color.green.opacity(0.7) : .clear, radius: 5, x: 0, y: 0)
            .onTapGesture {
                selectedBolt = label
            }
        }
    }
    
    struct ComponentPickerTwoSides: View {
        let color: Color
        let label: String
        @Binding var clickCount_Head: Int
        @Binding var clickCount_Nut: Int
        let valuesMaxValue: Int
        
        func valuesAppendingFunction() -> [Int] {
            var values: [Int] = []

            for i in 0...valuesMaxValue {
                values.append(i)
            }
            return values
        }
        
        let washerWidth: CGFloat
        let scale: Double
        
        var body: some View {
            
            let bolt_01 = boltDIN931 (
                boltDiameter: 10,
                DIN931Head_h: 10,
                DIN931Head_W: 20,
                DIN931_L: 35,
                DIN931Thread_L: 20,
                drawScale: scale
            )
            
            let washerDIN125_01 = washerDIN125 (
                washerDIN125_h: 4,
                washerDIN125_W: 25,
                drawScale: scale
            )
            
            let washerDIN9021_01 = washerDIN9021 (
                washerDIN9021_h: 4,
                washerDIN9021_W: 25,
                drawScale: scale
            )
            
            let nut934_01 = nutDIN934 (
                nutDIN934_h: 8,
                nutDIN934_W: 20,
                drawScale: scale
            )
            
            HStack(spacing: -20) {
                ZStack {
                    Circle()
                        .frame(width: 35)
                        .foregroundColor(color)
                    Circle()
                        .frame(width: washerWidth)
                        .foregroundColor(Color(.systemBackground))
                }
                
                Spacer(minLength: 45)
                
                Text(label)
                    .font(.system(size: 15))
                    .frame(width: 35)
                
                
                HStack(spacing: -10) {
                    Picker("", selection: $clickCount_Head) {
                        ForEach(valuesAppendingFunction(), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                    .frame(width: 75, height: 100)
                    .clipped()
                    
                    ZStack {
                        bolt_01
                        Group {
                            if label == "DIN 125" {
                                washerDIN125_01
                            } else if label == "DIN 9021" {
                                washerDIN9021_01
                            }
                        }
                            .offset(CGSize(width: 0, height: (-13+2) * scale))
                        Group {
                            if label == "DIN 125" {
                                washerDIN125_01
                            } else if label == "DIN 9021" {
                                washerDIN9021_01
                            }
                        }
                            .offset(CGSize(width: 0, height: (10.0) * scale))
                        
                        nut934_01
                            .offset(CGSize(width: 0, height: (16.0) * scale))
                        
                        Rectangle()
                            .frame(width: 11 * scale, height: 10 * scale)
                            .foregroundColor(Color(.systemBackground))
                            .offset(CGSize(width: 0, height: (-0.5) * scale))
                        
                    }
                        .rotationEffect(.degrees(-90))
                    
                    Picker("", selection: $clickCount_Nut) {
                        ForEach(valuesAppendingFunction(), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                    .frame(width: 75, height: 100)
                    .clipped()
                }
            }
        }
    }
    
    struct ComponentPickerOneSide: View {
        let color: Color
        let label: String
        @Binding var clickCount: Int
        let valuesMaxValue: Int
        
        func valuesAppendingFunction() -> [Int] {
            var values: [Int] = []

            for i in 0...valuesMaxValue {
                values.append(i)
            }
            return values
        }
        
        var body: some View {
            HStack(spacing: 10) {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 20)
                    .foregroundColor(color)
                Text(label)
                    .font(.system(size: 15))
                    .frame(width: 35)
                Spacer()
                
                HStack(spacing: -10) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 20)
                        .foregroundColor(color)
                    
                    Picker("", selection: $clickCount) {
                        ForEach(valuesAppendingFunction(), id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                    .frame(width: 75, height: 100)
                    .clipped()
                }
            }
        }
    }
}

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...5].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }
    
    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
            let angle = CGFloat.pi / 3 * CGFloat(i) + CGFloat.pi / 6
            let point = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            points.append(point)
        }
        return points
    }
}

#Preview {
    ContentView()
}
