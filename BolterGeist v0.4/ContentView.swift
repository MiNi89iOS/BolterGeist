//
//  ContentView.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var diameterManager = BoltDiameter()
    @StateObject private var gradationState = GradationState()
    @StateObject private var matThkTextFieldData = MaterialThkTextFieldData()
    @StateObject private var threadEntry = ThreadEntryData()
    @StateObject private var componentList = ComponentList()
    @StateObject private var drawingScale = DrawingScale()
    
    var body: some View {
        NavigationSplitView {
           List {
                            NavigationLink("BolterGeist Intuo") {
                                BolterGeistIntuitive()
                                .navigationTitle("BolterGeist Intuo")
                            }
                           
                            NavigationLink("BolterGeist PRO") {
                                BolterGeistPro()
                                .navigationTitle("BolterGeist PRO")
                                .environmentObject(diameterManager)
                                .environmentObject(gradationState)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(threadEntry)
                                .environmentObject(componentList)
                                .environmentObject(drawingScale)
                                .animation(.bouncy)
                            }
                            
                            NavigationLink("Settings") {
                                SettingsView()
                                .navigationTitle("Settings")
                                .environmentObject(diameterManager)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(componentList)
                                .environmentObject(gradationState)
                                .environmentObject(drawingScale)
                            }
                            
                            NavigationLink("Help") {
                                HelpView()
                                .navigationTitle("Help")
                            }
                           
                            NavigationLink("About") {
                                AboutView()
                                .navigationTitle("About")
                            }
                    }
        } detail: {
            Text("Welcome to BolterGeist")
        }
    }
}


#Preview {
    ContentView()
}
