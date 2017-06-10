//
//  DrinkInBody.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

class DrinkInBody {
    var _maxBac: Double
    var _currentBac: Double
    var _timeElapsed: Double
    var _standardDrinks: Double
    var _digestionFactor: Double // Accounts for digestion time, determined by amount of food in system
    
    init(maxBacFromDrink: Double, currentBacFromDrink: Double, timeElapsed: Double, standardDrinks: Double, digestionFactor: Double) {
        _maxBac          = maxBacFromDrink
        _currentBac      = currentBacFromDrink
        _timeElapsed     = timeElapsed
        _standardDrinks  = standardDrinks
        _digestionFactor = digestionFactor
    }
    
    var maxBac: Double          { return _maxBac }
    var currentBac: Double      { return _currentBac }
    var timeElapsed: Double     { return _timeElapsed }
    var standardDrinks: Double  { return _standardDrinks }
    var digestionFactor: Double { return _digestionFactor }
}
