//
//  RungeKutta.swift
//  ShcrodingerDiff
//
//  Created by Spencer Lee on 3/26/21.
//

import Foundation
import SwiftUI
import CorePlot

class RungeKutta: ObservableObject {
    
    let hbar2overem = 7.61996423107385308868
    @ObservedObject var potential = Potentials()
    
    func shootingMethod(stepSize: Double, energyGuess: Double) -> Double {
        
        var psi: [Double] = []
        var psiP: [Double] = []
        var psi2P: [Double] = []
        var k1: [Double] = [] // first slope, same as shooting method
        var y1: [Double] = []
        
        let xMin = potential.xMin
        let xMax = potential.xMax
        let dX = stepSize
        let energy = energyGuess
        
        psi.append(0.0)
        psiP.append(2.0)
        psi2P.append(0.0)
        
        var n = 0
        
        for xValue in stride(from: xMin, through: xMax, by: dX){
            
            psiP.append(psiP[n] + psi2P[n] * dX)
            psi.append(psi[n] + psiP[n] * dX)
            psi2P.append(-(2 / hbar2overem) * psi[n+1] * energy)
            
            k1.append(psiP[n] + psi2P[n] * dX)
            y1.append(k1[n] * dX / 2 + psiP[n])
            
            n += 1
            
            
        }
        return y1[y1.count-1]
}
}
