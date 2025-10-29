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
    
    @State private var showDisclaimer = false
    
    var body: some View {
        NavigationSplitView {
           List {
                            NavigationLink("BolterGeist Intuo") {
                                BolterGeistIntuitive()
                                .navigationTitle("BolterGeist Intuo")
                                .navigationBarTitleDisplayMode(.inline)
                            }
                           
                            NavigationLink("BolterGeist PRO") {
                                BolterGeistPro()
                                .navigationTitle("BolterGeist PRO")
                                .navigationBarTitleDisplayMode(.inline)
                                .environmentObject(diameterManager)
                                .environmentObject(gradationState)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(threadEntry)
                                .environmentObject(componentList)
                                .environmentObject(drawingScale)
                            }
                            
                            NavigationLink("Settings") {
                                SettingsView()
                                .navigationTitle("Settings")
                                .navigationBarTitleDisplayMode(.inline)
                                .environmentObject(diameterManager)
                                .environmentObject(matThkTextFieldData)
                                .environmentObject(componentList)
                                .environmentObject(gradationState)
                                .environmentObject(drawingScale)
                            }
                            
                            NavigationLink("Help") {
                                HelpView()
                                .navigationTitle("Help")
                                .navigationBarTitleDisplayMode(.inline)
                            }
                           
                            NavigationLink("About") {
                                AboutView()
                                .navigationTitle("About")
                                .navigationBarTitleDisplayMode(.inline)
                            }
                    }
        } detail: {
            Text("Welcome to BolterGeist")
        }
        .onAppear {
            // Pokaż przy pierwszym uruchomieniu (lub gdy użytkownik nie zaakceptował)
            let accepted = UserDefaults.standard.bool(forKey: "disclaimerAccepted")
            showDisclaimer = !accepted
        }
        .sheet(isPresented: $showDisclaimer) {
            DisclaimerSheet {
                // Po akceptacji zapisujemy flagę i zamykamy sheet
                UserDefaults.standard.set(true, forKey: "disclaimerAccepted")
                showDisclaimer = false
            }
        }
    }
}


#Preview {
    ContentView()
}
