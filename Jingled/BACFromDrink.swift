//
//  DrinkInBody.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

// Calculates Bac given from a drink. Takes into account digestion and motablizing of alcohol
class BACFromDrink {
    let _standardDrinks: Double!
    let _weightOfPerson: Double!
    let _bodyWaterConstant: Double!
    var _digestionFactor: Double!
    var _currentBac = 0.0
    var _timeElapsed = 0.0
    
    init(drink: Drink, digestionOfDrink: DigestionOfDrink, person: Person) {
        _standardDrinks = drink.numOfStandardDrinks
        _digestionFactor = digestionOfDrink.digestionFactor
        _bodyWaterConstant = person.bodyWaterConstant
        _weightOfPerson = person.weight
    }
    
    var currentBac: Double { return _currentBac }
    
    func updatedInfo(digestionOfDrink: DigestionOfDrink) {
        _digestionFactor = digestionOfDrink.digestionFactor
        calcualteBloodAlcoholContent()
    }
    
    // Calcualtes current BAC of a drink
    private func calcualteBloodAlcoholContent() {
        let standardDrinks = _standardDrinks * _digestionFactor
        let percentWaterInBody = 0.806
        let factor = 1.2 // Factor set used to calculate BAC
        let metabolicConstant = 0.017 // Rate at which alcohol is metabolised by body
        _timeElapsed += 1.0
        
        _currentBac = (((percentWaterInBody * standardDrinks * factor)/(_weightOfPerson * _bodyWaterConstant)) - (metabolicConstant * _timeElapsed))
        
        if _currentBac < 0.0 { _currentBac = 0.0 }
    }
}
