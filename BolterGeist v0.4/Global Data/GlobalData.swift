//
//  GlobalData.swift
//  BolterGeist v0.4
//
//  Created by Mi Ni on 25/12/2023.
//

import SwiftUI

// Przypisanie wysokości łba śruby
let DIN931HeadHeight = (
    M3: 2.0,
    M4: 2.8,
    M5: 3.5,
    M6: 4.0,
    M8: 5.3,
    M10: 6.4,
    M12: 7.5,
    M16: 10.0,
    M20: 12.5,
    M24: 15.0,
    M30: 18.7
)

// Przypisanie szerokości łba śruby (e, czyli większa szerokość - średnica okręgu opisanego na łbie śruby))
let DIN931HeadWidth = (
    M3: 6.01,
    M4: 7.66,
    M5: 8.79,
    M6: 11.05,
    M8: 14.38,
    M10: 18.9,
    M12: 21.1,
    M16: 26.75,
    M20: 33.53,
    M24: 39.98,
    M30: 50.85
)

// Przypisanie długości części gwintowanej trzpieni, poszczególnych średnic śrub, do zbiorów.
let boltThreadLength = (
    M3: [12, 18, 31],
    M4: [14, 20, 33],
    M5: [16, 22, 35],
    M6: [18, 24, 37],
    M8: [22, 28, 41],
    M10: [26, 32, 45],
    M12: [30, 36, 49],
    M16: [38, 44, 57],
    M20: [46, 52, 65],
    M24: [54, 60, 73],
    M30: [66, 72, 85]
)

// Przypisanie skoku gwintu dla poszczególnych średnic śrub.
let threadPitch = (
    M3: 0.5,
    M4: 0.7,
    M5: 0.8,
    M6: 1.0,
    M8: 1.25,
    M10: 1.5,
    M12: 1.75,
    M16: 2.0,
    M20: 2.5,
    M24: 3.0,
    M30: 3.5
)

// Przypisanie grubości podkładek DIN125 dla poszczególnych średnic śrub.
let washerDIN125Thickness = (
    M3: 0.5,
    M4: 0.8,
    M5: 1.0,
    M6: 1.6,
    M8: 1.6,
    M10: 2.0,
    M12: 2.5,
    M16: 3.0,
    M20: 3.0,
    M24: 4.0,
    M30: 4.0
)

// Przypisanie średnicy zewnętrznej podkładek DIN125 dla poszczególnych średnic śrub.
let washerDIN125DiameterExternal = (
    M3: 7.0,
    M4: 9.0,
    M5: 10.0,
    M6: 12.0,
    M8: 16.0,
    M10: 20.0,
    M12: 24.0,
    M16: 30.0,
    M20: 37.0,
    M24: 44.0,
    M30: 56.0
)

// Przypisanie grubości podkładek DIN9021 dla poszczególnych średnic śrub.
let washerDIN9021Thickness = (
    M3: 0.8,
    M4: 1.0,
    M5: 1.2,
    M6: 1.6,
    M8: 2.0,
    M10: 2.5,
    M12: 3.0,
    M16: 3.0,
    M20: 4.0,
    M24: 5.0,
    M30: 6.0
)

// Przypisanie średnicy zewnętrznej podkładek DIN9021 dla poszczególnych średnic śrub.
let washerDIN9021DiameterExternal = (
    M3: 9.0,
    M4: 12.0,
    M5: 15.0,
    M6: 18.0,
    M8: 24.0,
    M10: 30.0,
    M12: 37.0,
    M16: 50.0,
    M20: 60.0,
    M24: 72.0,
    M30: 92.0
)

// Przypisanie grubości (wysokości) nakrętek dla poszczególnych średnic śrub.
let nutDIN934Thickness = (
    M3: 2.4,
    M4: 3.2,
    M5: 4.0,
    M6: 5.0,
    M8: 6.5,
    M10: 8.0,
    M12: 10.0,
    M16: 13.0,
    M20: 16.0,
    M24: 19.0,
    M30: 24.0
)

// Przypisanie szerokości (e) nakrętek dla poszczególnych średnic śrub.
let nutDIN934Width = (
    M3: 6.01,
    M4: 7.66,
    M5: 8.79,
    M6: 11.05,
    M8: 14.38,
    M10: 18.9,
    M12: 21.1,
    M16: 26.75,
    M20: 32.95,
    M24: 39.55,
    M30: 50.85
)

// Przypisanie grubości (wysokości) nakrętek dla poszczególnych średnic śrub.
let nutDIN439Thickness = (
    M3: 1.8,
    M4: 2.2,
    M5: 2.7,
    M6: 3.2,
    M8: 4.0,
    M10: 5.0,
    M12: 6.0,
    M16: 8.0,
    M20: 10.0,
    M24: 12.0,
    M30: 15.0
)

// Przypisanie szerokości (e) nakrętek dla poszczególnych średnic śrub.
let nutDIN439Width = (
    M3: 6.08,
    M4: 7.74,
    M5: 8.87,
    M6: 11.05,
    M8: 14.38,
    M10: 18.9,
    M12: 21.1,
    M16: 26.75,
    M20: 33.53,
    M24: 39.98,
    M30: 51.28
)

var resultEntryAbsoluteResult = false
var resultThreadEntry: Bool = false
var resultThreadEntryValue: Double = 0

var resultSumOfComponents: Bool = false
var resultSumOfComponents_02: Bool = false

var boltLength: [Int] = []

var result: Double = 0
var i = 0
var j = 0

var isOKValue: Bool = true

// funkcja
func valueAssignement(bolt_D: Int) -> (
 DIN931Head_h: Double,
 DIN931Head_W: Double,
 boltThread_L: [Int],
 washerDIN125_h: Double,
 washerDIN125_D_Ext: Double,
 washerDIN9021_h: Double,
 washerDIN9021_D_Ext: Double,
 nutDIN934_h: Double,
 nutDIN934_W: Double,
 nutDIN439_h: Double,
 nutDIN439_W: Double,
 boltThread_p: Double ) {
    
    var result: (
        DIN931Head_h: Double,
        DIN931Head_W: Double,
        boltThread_L: [Int],
        washerDIN125_h: Double,
        washerDIN125_D_Ext: Double,
        washerDIN9021_h: Double,
        washerDIN9021_D_Ext: Double,
        nutDIN934_h: Double,
        nutDIN934_W: Double,
        nutDIN439_h: Double,
        nutDIN439_W: Double,
        boltThread_p: Double
    )

    switch bolt_D {
    case 3:
        result = (
            DIN931HeadHeight.M3,
            DIN931HeadWidth.M3,
            boltThreadLength.M3,
            washerDIN125Thickness.M3,
            washerDIN125DiameterExternal.M3,
            washerDIN9021Thickness.M3,
            washerDIN9021DiameterExternal.M3,
            nutDIN934Thickness.M3,
            nutDIN934Width.M3,
            nutDIN439Thickness.M3,
            nutDIN439Width.M3,
            threadPitch.M3
        )
    case 4:
        result = (
            DIN931HeadHeight.M4,
            DIN931HeadWidth.M4,
            boltThreadLength.M4,
            washerDIN125Thickness.M4,
            washerDIN125DiameterExternal.M4,
            washerDIN9021Thickness.M4,
            washerDIN9021DiameterExternal.M4,
            nutDIN934Thickness.M4,
            nutDIN934Width.M4,
            nutDIN439Thickness.M4,
            nutDIN439Width.M4,
            threadPitch.M4
        )
    case 5:
        result = (
            DIN931HeadHeight.M5,
            DIN931HeadWidth.M5,
            boltThreadLength.M5,
            washerDIN125Thickness.M5,
            washerDIN125DiameterExternal.M5,
            washerDIN9021Thickness.M5,
            washerDIN9021DiameterExternal.M5,
            nutDIN934Thickness.M5,
            nutDIN934Width.M5,
            nutDIN439Thickness.M5,
            nutDIN439Width.M5,
            threadPitch.M5
        )
    case 6:
        result = (
            DIN931HeadHeight.M6,
            DIN931HeadWidth.M6,
            boltThreadLength.M6,
            washerDIN125Thickness.M6,
            washerDIN125DiameterExternal.M6,
            washerDIN9021Thickness.M6,
            washerDIN9021DiameterExternal.M6,
            nutDIN934Thickness.M6,
            nutDIN934Width.M6,
            nutDIN439Thickness.M6,
            nutDIN439Width.M6,
            threadPitch.M6
        )
    case 8:
        result = (
            DIN931HeadHeight.M8,
            DIN931HeadWidth.M8,
            boltThreadLength.M8,
            washerDIN125Thickness.M8,
            washerDIN125DiameterExternal.M8,
            washerDIN9021Thickness.M8,
            washerDIN9021DiameterExternal.M8,
            nutDIN934Thickness.M8,
            nutDIN934Width.M8,
            nutDIN439Thickness.M8,
            nutDIN439Width.M8,
            threadPitch.M8
        )
    case 10:
        result = (
            DIN931HeadHeight.M10,
            DIN931HeadWidth.M10,
            boltThreadLength.M10,
            washerDIN125Thickness.M10,
            washerDIN125DiameterExternal.M10,
            washerDIN9021Thickness.M10,
            washerDIN9021DiameterExternal.M10,
            nutDIN934Thickness.M10,
            nutDIN934Width.M10,
            nutDIN439Thickness.M10,
            nutDIN439Width.M10,
            threadPitch.M10
        )
    case 12:
        result = (
            DIN931HeadHeight.M12,
            DIN931HeadWidth.M12,
            boltThreadLength.M12,
            washerDIN125Thickness.M12,
            washerDIN125DiameterExternal.M12,
            washerDIN9021Thickness.M12,
            washerDIN9021DiameterExternal.M12,
            nutDIN934Thickness.M12,
            nutDIN934Width.M12,
            nutDIN439Thickness.M12,
            nutDIN439Width.M12,
            threadPitch.M12
        )
    case 16:
        result = (
            DIN931HeadHeight.M16,
            DIN931HeadWidth.M16,
            boltThreadLength.M16,
            washerDIN125Thickness.M16,
            washerDIN125DiameterExternal.M16,
            washerDIN9021Thickness.M16,
            washerDIN9021DiameterExternal.M16,
            nutDIN934Thickness.M16,
            nutDIN934Width.M16,
            nutDIN439Thickness.M16,
            nutDIN439Width.M16,
            threadPitch.M16
        )
    case 20:
        result = (
            DIN931HeadHeight.M20,
            DIN931HeadWidth.M20,
            boltThreadLength.M20,
            washerDIN125Thickness.M20,
            washerDIN125DiameterExternal.M20,
            washerDIN9021Thickness.M20,
            washerDIN9021DiameterExternal.M20,
            nutDIN934Thickness.M20,
            nutDIN934Width.M20,
            nutDIN439Thickness.M20,
            nutDIN439Width.M20,
            threadPitch.M20
        )
    case 24:
        result = (
            DIN931HeadHeight.M24,
            DIN931HeadWidth.M24,
            boltThreadLength.M24,
            washerDIN125Thickness.M24,
            washerDIN125DiameterExternal.M24,
            washerDIN9021Thickness.M24,
            washerDIN9021DiameterExternal.M24,
            nutDIN934Thickness.M24,
            nutDIN934Width.M24,
            nutDIN439Thickness.M24,
            nutDIN439Width.M24,
            threadPitch.M24
        )
    case 30:
        result = (
            DIN931HeadHeight.M30,
            DIN931HeadWidth.M30,
            boltThreadLength.M30,
            washerDIN125Thickness.M30,
            washerDIN125DiameterExternal.M30,
            washerDIN9021Thickness.M30,
            washerDIN9021DiameterExternal.M30,
            nutDIN934Thickness.M30,
            nutDIN934Width.M30,
            nutDIN439Thickness.M30,
            nutDIN439Width.M30,
            threadPitch.M30
        )
    default:
        result = (
            DIN931HeadHeight.M8,
            DIN931HeadWidth.M8,
            boltThreadLength.M8,
            washerDIN125Thickness.M8,
            washerDIN125DiameterExternal.M8,
            washerDIN9021Thickness.M8,
            washerDIN9021DiameterExternal.M8,
            nutDIN934Thickness.M8,
            nutDIN934Width.M8,
            nutDIN439Thickness.M8,
            nutDIN439Width.M8,
            threadPitch.M8
        )
    }
    return result
}
// koniec funkcji

// funkcja
func boltLengthAssignement (
    gradation_5mm: Bool,
    gradation_10mm: Bool,
    gradation_20mm: Bool,
    boltThread_L: [Int],
    boltLengthMax: Int
) -> [Int] {
    boltLength.removeAll()
    var bolt_L = 0
    
    if gradation_5mm == true {
        bolt_L = 0
        while bolt_L <= boltThread_L[0] {
            bolt_L += 5
        }
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 5
        }
    } else if gradation_10mm == true {
        bolt_L = 0
        while bolt_L <= boltThread_L[0] || bolt_L%10 != 0 {
            bolt_L += 10
        }
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 10
        }
    } else if gradation_20mm == true {
        bolt_L = 0
        while bolt_L <= boltThread_L[0] || bolt_L%20 != 0 {
            bolt_L += 20
        }
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 20
        }
    }
    
    return boltLength
    
}
// koniec funkcji

// funkcja
func boltLengthDIN933Assignement (
    gradation_5mm: Bool,
    gradation_10mm: Bool,
    gradation_20mm: Bool,
    boltLengthMax: Int
) -> [Int] {
    boltLength.removeAll()
    var bolt_L = 0
    
    if gradation_5mm == true {
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 5
        }
    } else if gradation_10mm == true {
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 10
        }
    } else if gradation_20mm == true {
        bolt_L = 0
        while bolt_L <= boltLengthMax {
            boltLength.append(bolt_L)
            bolt_L += 20
        }
    }
    
    boltLength.remove(at: 0)
    return boltLength
    
}
// koniec funkcji


// funkcja
func sumOfNutsCheck (
    boltThread_L: [Int],
    nutDIN934_h: Double,
    nutDIN439_h: Double,
    nutDIN934Count: Int,
    nutDIN439Count: Int
) -> Bool {
    let sumOfNuts = nutDIN934_h * Double(nutDIN934Count)                                            // Suma wszystkich nakrętek
    + nutDIN439_h * Double(nutDIN439Count)
    
    if sumOfNuts > Double(boltThread_L[j]) {
        j = 0                                     // zerowanie j
        resultSumOfComponents_02 = true
        return resultSumOfComponents_02
    } else {
        j = 0                                     // zerowanie j
        resultSumOfComponents_02 = false
        return resultSumOfComponents_02
    }
}
// koniec funkcji

// funkcja
func boltLengthCalc (
    boltThread_L: [Int],
    washerDIN125_h: Double,
    washerDIN9021_h: Double,
    nutDIN934_h: Double,
    nutDIN439_h: Double,
    boltThread_p: Double,
    headWasherDIN125Count:Int,
    headWasherDIN9021Count:Int,
    nutWasherDIN125Count: Int,
    nutWasherDIN9021Count: Int,
    nutDIN934Count: Int,
    nutDIN439Count: Int,
    thicknessOfElements: Double,
    threadEntry: Bool,
    acceptableThreadEntry: Double,
    threadEntryAbsolute: Bool,
    thread_pFactor: Int
) -> Int {
    
    result = 0
    i = 0
    j = 0
    
    while true {
        // Obliczenia wartości result.
        if boltLength[i] <= 125 {
            result = Double(boltLength[i])
            - washerDIN125_h * Double(headWasherDIN125Count)
            - washerDIN9021_h * Double(headWasherDIN9021Count)
            - thicknessOfElements
            - Double(boltThread_L[j])
        } else if boltLength[i] > 125 && boltLength[i] <= 200 {
            j = 1
            result = Double(boltLength[i])
            - washerDIN125_h * Double(headWasherDIN125Count)
            - washerDIN9021_h * Double(headWasherDIN9021Count)
            - thicknessOfElements
            - Double(boltThread_L[j])
        } else if boltLength[i] > 200 {
            j = 2
            result = Double(boltLength[i])
            - washerDIN125_h * Double(headWasherDIN125Count)
            - washerDIN9021_h * Double(headWasherDIN9021Count)
            - thicknessOfElements
            - Double(boltThread_L[j])
        }
        
        let sumOfComponents = washerDIN125_h * Double(headWasherDIN125Count)                            // Suma wszystkich elementów (musi być mniejsza od długosci śruby)
        + washerDIN9021_h * Double(headWasherDIN9021Count)
        + thicknessOfElements
        + washerDIN9021_h * Double(nutWasherDIN9021Count)
        + washerDIN125_h * Double(nutWasherDIN125Count)
        + nutDIN934_h * Double(nutDIN934Count)
        + nutDIN439_h * Double(nutDIN439Count)
            
       if sumOfComponents > (Double(boltLength[i]) - boltThread_p * Double(thread_pFactor)) {    // gdy nakrętka wystaje poza obrys trzpienia lub przekracza dopuszczalną ilość zwojów poza nakrętką
            i += 1
            if i == (boltLength.count){
                i -= 1
                resultSumOfComponents = true
                return boltLength[i]
            }
        } else if threadEntryAbsolute {                                                        // wariant, gdy dopuszczalne jest nieskończone wejście gwintu w materiał
            var resultAbsolute: Double = 0
            resultAbsolute = Double(boltLength[i])
            - washerDIN125_h * Double(headWasherDIN125Count)
            - washerDIN9021_h * Double(headWasherDIN9021Count)
            - thicknessOfElements
            - washerDIN125_h * Double(nutWasherDIN125Count)
            - washerDIN9021_h * Double(nutWasherDIN9021Count)
            - nutDIN934_h * Double(nutDIN934Count)
            - nutDIN439_h * Double(nutDIN439Count)
            
            if resultAbsolute > 0
                && resultAbsolute >= boltThread_p * Double(thread_pFactor)
                && result <= (Double(nutWasherDIN125Count) * washerDIN125_h + Double(nutWasherDIN9021Count) * washerDIN9021_h) {
                    resultThreadEntryValue = round(result * 100) / 100
                    resultEntryAbsoluteResult = true
                    return boltLength[i]
            } else if result > (Double(nutWasherDIN125Count) * washerDIN125_h + Double(nutWasherDIN9021Count) * washerDIN9021_h) {
                if i == 0 {
                    return boltLength[i]
                } else {
                    return boltLength[i-1]
                }
                 // index out of range !!! // DIN 125 1-2; DIN934 - 1; DIN 439 - 3; zmiana z 10mm na 20mm gradation - NAPRAWIONE
            } else {
                i += 1
            }
            
        } else if result >= -acceptableThreadEntry                            // wariant, gdy dopuszczalne jest wejście gwintu w materiał na określoną głębokość
                    && result < 0
                    && threadEntry == true {
            resultThreadEntryValue = round(result * 100) / 100
            resultThreadEntry = true
            return boltLength[i]                                       // po co ten i += 1 ??? USUWAM i += 1 !!! DODAJĘ return boltLength[i] !!! //
            
        } else if result < 0 {
            i += 1
                                                                // powinien być jeszcze jeden warunek: jeśli result >= 0 i result mniejsze od grubości podładek //
        } else {
            return boltLength[i]
        }
        
        if i == (boltLength.count){
            i -= 1
            return boltLength[i]
        }
    }
}
// koniec funkcji

/*
 func boltDIN933LengthCalc() {
 -> pobrać pierwszą długość ze zbioru boltLength[i]   OK
 -> długość śruby odjąć suma komponentów musi być większe od dopuszczalnej liczby zwojów poza nakrętką   OK
 a jeśli jest mniejsze, to obliczyć dla kolejnej długości śruby  OK
 -> suma podkładek i materiału łączonego musi być większa niż ten kątowy odcinek przy łbie
 -> jeśli nie są spełnione warunki, to śruba niedobrana
 
 -> wprowadzić zmienną Bool dotyczącą dobrania/niedobrania śruby
 -> wartością return jest długość śruby
 }
 */

var DIN933isOK: Bool = false

// funkcja
func boltDIN933LengthCalc (
    washerDIN125_h: Double,
    washerDIN9021_h: Double,
    nutDIN934_h: Double,
    nutDIN439_h: Double,
    boltThread_p: Double,
    headWasherDIN125Count:Int,
    headWasherDIN9021Count:Int,
    nutWasherDIN125Count: Int,
    nutWasherDIN9021Count: Int,
    nutDIN934Count: Int,
    nutDIN439Count: Int,
    thicknessOfElements: Double,
    thread_pFactor: Int
) -> Int {
    
    result = 0
    i = 0
    DIN933isOK = false
    
    while true {
        result = Double(boltLength[i])
        - washerDIN125_h * Double(headWasherDIN125Count)
        - washerDIN9021_h * Double(headWasherDIN9021Count)
        - thicknessOfElements
        - washerDIN125_h * Double(nutWasherDIN125Count)
        - washerDIN9021_h * Double(nutWasherDIN9021Count)
        - nutDIN934_h * Double(nutDIN934Count)
        - nutDIN439_h * Double(nutDIN439Count)
        
        if result < Double(thread_pFactor) * boltThread_p {
            i += 1
            if i == (boltLength.count) {
                i -= 1
                break
            }
        } else {
            DIN933isOK = true
            break
        }
    }
    
    return boltLength[i]
}
// koniec funkcji

// funkcja
func boltResult (
    washerDIN125_h: Double,
    washerDIN9021_h: Double,
    bolt_D: Int,
    threadEntry: Bool,
    acceptableThreadEntry: Double,
    nutWasherDIN125Count: Int,
    nutWasherDIN9021Count: Int,
    nutDIN934Count: Int,
    nutDIN439Count: Int
) -> String {
    
    if nutDIN439Count == 0 && nutDIN934Count == 0 {                                                 // jeśli nie ma nakrętek
        let resultString = "Dodaj nakrętkę!"
        print(resultString)
        isOKValue = false
        return resultString
        
    } else if resultSumOfComponents_02 == true {                                                    // jeśli suma grubości nakrętek jest większa od długości gwintu
        let resultString = "Nie dobrano śruby!\nZmniejsz ilość nakrętek!"
        print(resultString)
        isOKValue = false
        return resultString
        
    } else if resultSumOfComponents == true {
        let resultString = "Nie dobrano śruby!" // 3
        print(resultString)
        resultSumOfComponents = false
        isOKValue = false
        return resultString
        
    } else if resultEntryAbsoluteResult == true {                                                     // jeśli dopuszczalne jest nieograniczone wejście gwintu w materiał
        if result >= 0 && result <= (washerDIN125_h * Double(nutWasherDIN125Count) + washerDIN9021_h * Double(nutWasherDIN9021Count)) {
            let resultString = "Dobrano śrubę M\(bolt_D) x \(boltLength[i])"
            print(resultString)
            resultEntryAbsoluteResult = false
            isOKValue = true
            return resultString
        } else {
            let resultString = "Dobrano śrubę M\(bolt_D) x \(boltLength[i]) \nTrzpień gwintowany wchodzi \(-resultThreadEntryValue) mm w materiał."
            print(resultString)
            resultEntryAbsoluteResult = false
            isOKValue = true
            return resultString
        }
        
    } else if result < -acceptableThreadEntry {             // else if result < -acceptableThreadEntry // <- usunięto                  // tu jest coś nie tak //
        let resultString = "Grubość zaciskowa elementów jest zbyt duża, aby je skręcić!"
        print(resultString)
        isOKValue = false
        return resultString
        
    } else if result >= 0 && result <= (washerDIN125_h * Double(nutWasherDIN125Count) + washerDIN9021_h * Double(nutWasherDIN9021Count)) {
        let resultString = "Dobrano śrubę M\(bolt_D) x \(boltLength[i])"                      // jeśli nie dopuszcza się wejścia gwintu w materiał
        print(resultString)
        isOKValue = true
        return resultString
        
    } else if resultThreadEntry == true {                                             // jeśli dopuszczalne jest wejście gwintu w materiał na określoną głębokość
        let resultString = "Dobrano śrubę M\(bolt_D) x \(boltLength[i]) \n Trzpień gwintowany wchodzi \(-resultThreadEntryValue) mm w materiał." // było (boltLength[i-1])
        print(resultString)
        resultThreadEntry = false
        isOKValue = true
        return resultString
        // usunięto warunek //
    } else if threadEntry == false {                                                  // jeśli NIE dopuszcza się wejścia gwintu w materiał i result < 0
        let resultString = "Nie dobrano śruby!"// 1"
        print(resultString)
        isOKValue = false
        return resultString
        
    } else {                                                                          // jeśli DOPUSZCZA się wejścia gwintu w materiał i result < 0
        let resultString = "Nie dobrano śruby!"// 2"
        print(resultString)
        isOKValue = false
        return resultString
    }
}
// koniec funkcji

// funkcja
func boltDIN933Result (
    bolt_D: Int,
    nutDIN934Count: Int,
    nutDIN439Count: Int
) -> String {
    if nutDIN439Count == 0 && nutDIN934Count == 0 {
        let resultString = "Dodaj nakrętkę!"
        print(resultString)
        isOKValue = false
        return resultString
    } else if DIN933isOK == true {
        let resultString = "Dobrano śrubę M\(bolt_D) x \(boltLength[i])"
        print(resultString)
        isOKValue = true
        return resultString
    } else {
        let resultString = "Nie dobrano śruby!" // 1"
        print(resultString)
        isOKValue = false
        return resultString
    }
}
// koniec funkcji
