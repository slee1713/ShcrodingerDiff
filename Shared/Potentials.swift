//
//  Potentials.swift
//  ShcrodingerDiff
//
//  Created by Spencer Lee on 3/26/21.
//

import Foundation
import SwiftUI
import CorePlot

class Potentials: ObservableObject {
    
    // the default is infinite square well
    
    //var V = 0.0
    var xMin = 0.0
    var xMax = 10.0        // 0 to pi so sin(xMin) = 0 sin(xMax) = 0 to start
    
    
}   //end of potential class


class infiniteSquareWell: Potentials {
    
}   //end of infinite square well class, nothing is changed since it is the default of potentialClass anyway
