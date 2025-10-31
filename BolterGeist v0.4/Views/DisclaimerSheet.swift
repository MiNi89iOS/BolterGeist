//
//  DisclaimerSheet.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 29/10/2025.
//

import SwiftUI

struct DisclaimerSheet: View {
    var onAccept: () -> Void
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Important Notice")
                        .font(.title3).bold()
                    
                    Text("""
BolterGeist provides indicative calculations and a simplified 2D visualization to help with bolt and accessory selection. Results are for informational purposes only and require user verification.

Scope and Limitations:
• The app does not replace applicable standards, strength/stress calculations, or technical inspections/acceptance procedures.
• The author does not provide engineering consulting services.
• The correctness of results depends on the accuracy of your input data (diameters, thicknesses, number of washers, settings). Incorrect or incomplete inputs may lead to invalid results.

No Warranty and Limitation of Liability:
• The software is provided “AS IS”, without warranties of any kind.
• To the maximum extent permitted by law, the author(s) and contributors are not liable for any damages arising from the use of the software or reliance on its results.
• You are solely responsible for any decisions or actions taken based on the app’s output. Always verify results and consult a qualified engineer where appropriate.

By tapping “I Understand”, you acknowledge that you have read and understood this notice.
""")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    Button(action: onAccept) {
                        Text("I Understand")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                    }
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("Disclaimer")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .interactiveDismissDisabled(true) // wymusza świadomą akceptację
    }
}

#Preview {
    DisclaimerSheet {
        // preview
    }
}
