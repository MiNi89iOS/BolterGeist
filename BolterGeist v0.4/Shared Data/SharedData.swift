//
//  SharedData.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI


class BoltDiameter: ObservableObject {
     @Published var boltDiameter: Int
     
     var boltDiameterValue: Int {
         didSet {
             boltDiameter = boltDiameterValue
             UserDefaults.standard.set(boltDiameterValue, forKey: "boltDiameter")
         }
     }
     
     @Published var boltLengthMax: Int {
         didSet {
             UserDefaults.standard.set(boltLengthMax, forKey: "boltLengthMax")
         }
     }
    
    @Published var pFactor: Int {
        didSet {
            UserDefaults.standard.set(pFactor, forKey: "pFactor")
        }
    }

     init() {
         if UserDefaults.standard.object(forKey: "boltDiameter") == nil {
             boltDiameterValue = 10
             UserDefaults.standard.set(boltDiameterValue, forKey: "boltDiameter")
         } else {
             boltDiameterValue = UserDefaults.standard.integer(forKey: "boltDiameter")
         }
         
         boltDiameter = boltDiameterValue
     
         self.boltLengthMax = UserDefaults.standard.integer(forKey: "boltLengthMax")
         
         if UserDefaults.standard.object(forKey: "pFactor") == nil {
             self.pFactor = 2
             UserDefaults.standard.set(pFactor, forKey: "pFactor")
         } else {
             self.pFactor = UserDefaults.standard.integer(forKey: "pFactor")
         }
     
         if UserDefaults.standard.object(forKey: "boltLengthMax") == nil {
             self.boltLengthMax = 300
             UserDefaults.standard.set(boltLengthMax, forKey: "boltLengthMax")
         } else {
             self.boltLengthMax = UserDefaults.standard.integer(forKey: "boltLengthMax")
         }
     }
    
    func restoreDefaults() {
        boltDiameterValue = 10
        self.pFactor = 2
        self.boltLengthMax = 300
    }
}


class GradationState: ObservableObject {
    @Published var gradation_5mm: Bool = true
    @Published var gradation_10mm: Bool = false
    @Published var gradation_20mm: Bool = false

    @Published var selectedGradation: Gradation = .gradation_5mm {
        didSet {
            updateGradationValues()
            UserDefaults.standard.set(selectedGradation.rawValue, forKey: "selectedGradation")
        }
    }

    enum Gradation: String {
        case gradation_5mm
        case gradation_10mm
        case gradation_20mm
    }

    init() {
        if let savedGradation = UserDefaults.standard.string(forKey: "selectedGradation"),
           let gradation = Gradation(rawValue: savedGradation) {
            selectedGradation = gradation
            updateGradationValues()
        }
    }

    private func updateGradationValues() {
        switch selectedGradation {
        case .gradation_5mm:
            gradation_5mm = true
            gradation_10mm = false
            gradation_20mm = false
        case .gradation_10mm:
            gradation_5mm = false
            gradation_10mm = true
            gradation_20mm = false
        case .gradation_20mm:
            gradation_5mm = false
            gradation_10mm = false
            gradation_20mm = true
        }
    }
    
    func restoreDefaults() {
        selectedGradation = .gradation_5mm
    }
}

class MaterialThkTextFieldData: ObservableObject {
    @Published var matThkTextFieldValue: String = "10"
    @Published var matThkMax: Int {
            didSet {
                UserDefaults.standard.set(matThkMax, forKey: "matThkMax")
            }
        }

        init() {
            if UserDefaults.standard.object(forKey: "matThkMax") == nil {
                self.matThkMax = 200
                UserDefaults.standard.set(matThkMax, forKey: "matThkMax")
            } else {
                self.matThkMax = UserDefaults.standard.integer(forKey: "matThkMax")
            }
        }
    
    func restoreDefaults() {
        self.matThkMax = 200
    }
}

class ThreadEntryData: ObservableObject {
    @Published var threadEntry: Bool = false
    @Published var acceptableThreadEntry: String = "2"
    @Published var threadEntryAbsolute = false
}

class ComponentList: ObservableObject {
    @Published var washerDIN125Count_Head = 1
    @Published var washerDIN125Count_Nut = 1
    @Published var washerDIN9021Count_Head = 0
    @Published var washerDIN9021Count_Nut = 0
    @Published var nutDIN934Count = 1
    @Published var nutDIN439Count = 0
    @Published var selectedBolt: String?
        
        var selectedBoltValue: String {
            didSet {
                selectedBolt = selectedBoltValue
                UserDefaults.standard.set(selectedBoltValue, forKey: "SelectedBolt")
            }
        }
    
    @Published var washerCount: Int {
        didSet {
            UserDefaults.standard.set(washerCount, forKey: "washerCount")
        }
    }
    
    @Published var nutCount: Int {
        didSet {
            UserDefaults.standard.set(nutCount, forKey: "nutCount")
        }
    }

        init() {
            if UserDefaults.standard.object(forKey: "SelectedBolt") == nil {
                selectedBoltValue = "DIN 931"
                UserDefaults.standard.set(selectedBoltValue, forKey: "SelectedBolt")
            } else {
                selectedBoltValue = UserDefaults.standard.string(forKey: "SelectedBolt") ?? "DIN 931"
            }
            
            selectedBolt = selectedBoltValue
            
            self.washerCount = UserDefaults.standard.integer(forKey: "washerCount")
            self.nutCount = UserDefaults.standard.integer(forKey: "nutCount")
            
            if washerCount == 0 {
                washerCount = 2
                UserDefaults.standard.set(washerCount, forKey: "washerCount")
            }
            
            if nutCount == 0 {
                nutCount = 2
                UserDefaults.standard.set(nutCount, forKey: "nutCount")
            }
        }
    
    func restoreDefaults() {
        selectedBoltValue = "DIN 931"
        self.washerCount = 2
        self.nutCount = 2
    }
}

class DrawingScale: ObservableObject {
    @Published var drawingScale: Int
    
    var drawingScaleValue: Int {
        didSet {
            drawingScale = drawingScaleValue
            UserDefaults.standard.set(drawingScaleValue, forKey: "drawingScale")
        }
    }
    
    init() {
        if UserDefaults.standard.object(forKey: "drawingScale") == nil {
            drawingScaleValue = 5
            UserDefaults.standard.set(drawingScaleValue, forKey: "drawingScale")
        } else {
            drawingScaleValue = UserDefaults.standard.integer(forKey: "drawingScale")
        }
        
        drawingScale = drawingScaleValue
    }
    
    func restoreDefaults() {
        drawingScaleValue = 5
    }
}
