//
//  ThreadEntry.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct ThreadEntryView: View {
    @EnvironmentObject var threadEntry: ThreadEntryData
    @State private var previousThreadEntryAbsoluteState = false
    
    var body: some View {
        VStack(spacing: -10) {
            HStack {
                Toggle("", isOn: $threadEntry.threadEntry)
                    .frame(width: 30)
                Text("Thread Entry")
                    .font(.headline)
                    .frame(width: 125)
                Spacer()
            }
        
            HStack {
                HStack {
                    TextField("", text: $threadEntry.acceptableThreadEntry)
                        .disabled(!threadEntry.threadEntry)
                        .disabled(threadEntry.threadEntryAbsolute)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .onChange(of: threadEntry.acceptableThreadEntry) {
                            var filtered = threadEntry.acceptableThreadEntry.filter { "0123456789.".contains($0) }
                            
                            if filtered.first == "0" {
                                filtered = String(filtered.dropFirst())
                            }
                            
                            let components = filtered.components(separatedBy: ".")
                            if components.count > 1 {
                                filtered = components[0] + "." + String(components[1].prefix(1))
                            }
                            
                            // Limit the number to 500
                            if let number = Double(filtered), number > 300 {
                                filtered = "300"
                            }
                            
                            // Update the text field value
                            self.threadEntry.acceptableThreadEntry = filtered
                        }
                        .foregroundColor((!threadEntry.threadEntry || threadEntry.threadEntryAbsolute) ? .gray : .green)
                        .frame(width: 80)
                        .opacity((!threadEntry.threadEntry || threadEntry.threadEntryAbsolute) ? 0.5 : 1)
                }
                .frame(width: 40)
                
                Text("mm")
                
                Text("Acceptable Thread Entry")
                    .font(.system(size: 15))
                    .frame(width: 90)
                
                Spacer()
            }
            
            HStack {
                Toggle("", isOn: $threadEntry.threadEntryAbsolute)
                    .disabled(!threadEntry.threadEntry)
                    .onChange(of: threadEntry.threadEntry) {
                        if !threadEntry.threadEntry {
                            previousThreadEntryAbsoluteState = threadEntry.threadEntryAbsolute
                            threadEntry.threadEntryAbsolute = false
                        } else {
                            threadEntry.threadEntryAbsolute = previousThreadEntryAbsoluteState
                        }
                    }
                    .frame(width: 30)
                
                Text("Infinite Entry")
                    .font(.headline)
                    .frame(width: 125)
                Spacer()
            }
        }
        .padding(.leading)
        .frame(width: 200, height: 120)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color(red: 75/255, green: 75/255, blue: 75/255, opacity: 1), lineWidth: 1))

    }
}

#Preview {
    ContentView()
}
