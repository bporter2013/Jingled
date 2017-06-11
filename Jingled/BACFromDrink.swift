//
//  DrinkInBody.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

class BACFromDrink {
    let _maxBac: Double!
    let _standardDrinks: Double!
    var _currentBac: Double!
    var _timeElapsed: Double!
    var _digestionFactor: Double! // Accounts for digestion time, determined by amount of food in system
    
    init(maxBacFromDrink: Double, currentBacFromDrink: Double, standardDrinks: Double, digestionFactor: Double) {
        _maxBac          = maxBacFromDrink
        _currentBac      = currentBacFromDrink
        _timeElapsed     = 0.0
        _standardDrinks  = standardDrinks
        _digestionFactor = digestionFactor
    }
    
//    var maxBac: Double          { return _maxBac }
    var currentBac: Double      { return _currentBac }
//    var timeElapsed: Double     { return _timeElapsed }
//    var standardDrinks: Double  { return _standardDrinks }
//    var digestionFactor: Double { return _digestionFactor }
    
    func updatedBac(timeElapsedSinceLastUpdate: Double, currentDigestionFactor: Double) -> Double {
        _digestionFactor = currentDigestionFactor
        _timeElapsed += timeElapsedSinceLastUpdate
    }
    
    // Calcualtes BAC of a drink, timeElapsed is in minutes
    private func calcualteBloodAlcoholContent(of alcohol: Double, timeElapsed: Double) -> Double{
        let standardDrinks = alcohol
        let percentWaterInBody = 0.806
        let factor = 1.2 // Factor set used to calculate BAC
        let metabolicConstant = 0.017 // Rate at which alcohol is metabolised by body
        let drinkPeriod = timeElapsed
        
        let bloodAlcoholContent = (((percentWaterInBody * standardDrinks * factor)/(_weight * _bodyWaterConstant)) - (metabolicConstant * drinkPeriod))
        
        return bloodAlcoholContent
    }
}
