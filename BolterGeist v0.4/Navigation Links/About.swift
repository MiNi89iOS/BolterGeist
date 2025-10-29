//
//  About.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // App header
                VStack(alignment: .leading, spacing: 6) {
                    Text("BolterGeist")
                        .font(.title2).bold()
                    Text("Assistant for selecting bolts and accessories with a 2D assembly visualization.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Divider()

                // What it does
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is this app?")
                        .font(.headline)
                    Text("BolterGeist helps you choose a suitable bolt and accessories (washers, nuts) and visualizes the assembly in 2D. It estimates the required bolt length based on selected components, thickness of joined elements, and project settings.")
                        .fixedSize(horizontal: false, vertical: true)
                }

                // Key features
                VStack(alignment: .leading, spacing: 8) {
                    Text("Key features")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("• Bolt types: DIN 931 (partially threaded), DIN 933 (fully threaded), and experimental DIN 7991")
                        Text("• Diameter selection (M3…M30) and maximum bolt length")
                        Text("• Accessories: DIN 125 and DIN 9021 washers, DIN 934 and DIN 439 nuts")
                        Text("• Bolt length gradation: 5/10/20 mm")
                        Text("• Permissible number of thread pitches behind the nut (pFactor)")
                        Text("• Drawing Scale to adjust the 2D visualization")
                        Text("• Automatic length suggestion based on components, material thickness, and thread criteria")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }

                // Disclaimers
                VStack(alignment: .leading, spacing: 8) {
                    Text("Disclaimer")
                        .font(.headline)
                    Text("""
Results are for informational purposes and do not constitute technical documentation, engineering design, or assembly instructions. The app does not account for all norms, tolerances, production deviations, operating conditions, strength requirements, or safety rules. Use at your own risk.

Before applying results to real-world assemblies:
• verify the selection against applicable standards and guidelines,
• consult a qualified engineer,
• consider operating conditions (loads, vibration, environment, temperature, etc.).

NO WARRANTY. The software is provided “AS IS”, without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a particular purpose, and non-infringement.

LIMITATION OF LIABILITY. To the maximum extent permitted by applicable law, the author(s) and contributors shall not be liable for any direct, indirect, incidental, special, exemplary, or consequential damages arising out of or in connection with the use of this software or reliance on its results, even if advised of the possibility of such damages.
""")
                    .fixedSize(horizontal: false, vertical: true)
                }

                // Scope of the tool (engineering context)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Scope of the Tool")
                        .font(.headline)
                    Text("""
• The results are indicative and require verification by the user.
• The app does not replace standards, strength/stress calculations, or technical inspections/acceptance procedures.
• The author does not provide engineering consulting services.
""")
                    .fixedSize(horizontal: false, vertical: true)
                }

                // Input data quality
                VStack(alignment: .leading, spacing: 8) {
                    Text("Input Data")
                        .font(.headline)
                    Text("""
The correctness of results depends on the quality and accuracy of the input data (e.g., diameters, thicknesses, number of washers, settings). Incorrect or incomplete inputs may lead to invalid results.
""")
                    .fixedSize(horizontal: false, vertical: true)
                }

                // User responsibility
                VStack(alignment: .leading, spacing: 8) {
                    Text("User Responsibility")
                        .font(.headline)
                    Text("""
User is solely responsible for any decisions or actions taken based on the app’s output.
""")
                    .fixedSize(horizontal: false, vertical: true)
                }

                // License and trademarks
                VStack(alignment: .leading, spacing: 8) {
                    Text("License and Trademarks")
                        .font(.headline)
                    Text("""
Source code is licensed under the Apache License 2.0. See LICENSE and NOTICE for details.
“BolterGeist” and related logos/names are trademarks of Miłosz Niedziela. Trademark usage is governed by TRADEMARKS.md.
""")
                    .fixedSize(horizontal: false, vertical: true)

                    // Simple inline links (textual references)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("• License: LICENSE (in repository root)")
                        Text("• Notices and Attribution: NOTICE (in repository root)")
                        Text("• Trademark Use Policy: TRADEMARKS.md (in repository root)")
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                }

                // Contact
                VStack(alignment: .leading, spacing: 8) {
                    Text("Contact")
                        .font(.headline)
                    Text("For questions, suggestions, or issues, please open an issue in the repository or contact the author.")
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding()
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}
