//
//  Food.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

// Will calculate digestion factor used for BAC content of one drink
class InitialDigestion {
    
    private var _timeLeftToDigest: Double!
    private var _digestionFactor: Double!
    
    init(digestionTime: Double) {
        _timeLeftToDigest = digestionTime
        _digestionFactor = 1 / _timeLeftToDigest
    }
   
    var digestionFactor: Double { return _digestionFactor }
    
    // Updates digestionFactor. With minusing mintues since drink was inputted
    func updateDigestionFactor(timeElapsed: Double) {
        _timeLeftToDigest = (_timeLeftToDigest - timeElapsed) < 1 ? 1 : _timeLeftToDigest - timeElapsed
        _digestionFactor = 1 / _timeLeftToDigest
    }
}
