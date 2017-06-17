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
    
    private(set) var digestionTime: Double!
    
    init(initialDigestionTime: Double) {
        self.digestionTime = initialDigestionTime
    }
    
    // Adds more digestionTime. Called when food is consumed
    func changeDigestionTime(to digestionTime: Double) {
        if(digestionTime > 90) {
            self.digestionTime = 90
        } else if (digestionTime < 30) {
            self.digestionTime = 30
        } else {
            self.digestionTime = digestionTime
        }
    }
    
    func updateInfo(timeElapsed: Double) {
        digestionTime = (digestionTime - timeElapsed) < 30 ? 30 : digestionTime - timeElapsed
    }
}
