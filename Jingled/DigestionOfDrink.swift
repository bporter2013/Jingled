//
//  Food.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

// Will calculate digestion factor used for BAC content of one drink
class DigestionOfDrink {
    
    private var topValOfFactor: Double!
    private var timeToDigest: Double!
    private(set) var digestionFactor: Double!
    
    init(digestionTime: Double) {
        topValOfFactor = 1.0
        timeToDigest = digestionTime
        digestionFactor = topValOfFactor / timeToDigest
    }
    
    // Updates digestionFactor. With minusing mintues since drink was inputted
    func updateDigestionFactor(timeElapsed: Double) {
        topValOfFactor = (topValOfFactor + timeElapsed) <= timeToDigest ? topValOfFactor + timeElapsed : timeToDigest
        digestionFactor = topValOfFactor / timeToDigest
    }
}
