//
//  File.swift
//  Jingled
//
//  Created by Brett Porter on 6/11/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

// Will calculate and hold the value of how long it would take
// to digest a drink given current stomach contents.
class CurrentStomachContents {
    
    // Used to input common values. Only values that will be entered by user.
    // Correlates to minute till fully digested.
    static var none   = { 30.0 } // Empty
    static var little = { 60.0 } // Half Full
    static var alot   = { 90.0 } // Full Stomach
    
    private var _digestionTime: Double!
    
    init(digestionTime: Double) {
        _digestionTime = digestionTime    }
    
    var digestionTime: Double { return _digestionTime }
    
    // Adds more digestionTime. Called when food is consumed
    func addDigestionTime(_ addedDigestionTime: Double) {
        _digestionTime = (_digestionTime + addedDigestionTime) > 90 ? 90 : _digestionTime + addedDigestionTime
    }
    
    // Updates digestionFactor. With minusing mintues since drink was inputted
    func updateDigestionTime(timeElapsed: Double) {
        _digestionTime = (_digestionTime - timeElapsed) < 30 ? 30 : _digestionTime - timeElapsed
    }
}
