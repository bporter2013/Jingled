//
//  Drink.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

// Holds alcohol content of a drink. Used to determine total alcohol in the drink. 
// Right now only has calculations to support US standerd of measurements
class Drink {
    
    private var _alcoholByVolume: Double! // Assumed to be taken in as a percentage
    private var _volumeOfDrink: Double!   // Assumed to be taken in as ounces, for now; changed to liters
    private var _alcoholMass: Double!     // Will be held in grams

    init(alcoholByVolume: Double, volumeOfDrink: Double) {
        _alcoholByVolume = alcoholByVolume
        _volumeOfDrink = volumeOfDrink
        _alcoholMass = calculateAlcoholMass()
    }
    
    //Determines grams of pure alcohol in the drink
    private func calculateAlcoholMass() -> Double {
        let alcoholMassDensity = 23.341 // gram per fluid ounce
        let alcoholMass = (_volumeOfDrink * _alcoholByVolume * alcoholMassDensity)
        return alcoholMass
    }
    
    // A standard drink contains 10 grams of alcohol. Needed for other calculations
    var numOfStandardDrinks: Double {
        return _alcoholMass / 10
    }
    
}
