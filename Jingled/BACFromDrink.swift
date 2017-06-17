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
    private let standardDrinks: Double!
    private let weightOfPerson: Double!
    private let bodyWaterConstant: Double!
    private var digestionOfDrink: DigestionOfDrink!
    private var timeElapsed = 0.0
    private(set) var currentBac: Double!
    
    init(standardDrinks: Double, digestionOfDrink: DigestionOfDrink, bodyWaterConstant: Double, weight: Double) {
        self.standardDrinks = standardDrinks
        self.digestionOfDrink = digestionOfDrink
        self.bodyWaterConstant = bodyWaterConstant
        self.weightOfPerson = weight
        calcualteBloodAlcoholContent(timeElapsed: 0.0) // set inital currentBac value
    }
    
    func updateInfo(timeElapsed: Double) {
        self.timeElapsed += timeElapsed
        self.digestionOfDrink.updateDigestionFactor(timeElapsed: self.timeElapsed)
        calcualteBloodAlcoholContent(timeElapsed: self.timeElapsed)
    }
    
    // Calcualtes current BAC of a drink
    private func calcualteBloodAlcoholContent(timeElapsed: Double) {
        let percentWaterInBody = 0.806
        let factor = 1.2 // Factor set used to calculate BAC
        let metabolicConstant = 0.017 // Rate at which alcohol is metabolised by body
        self.timeElapsed += timeElapsed
        
        currentBac = (((percentWaterInBody * standardDrinks * factor)/(weightOfPerson * bodyWaterConstant)) - (metabolicConstant * (timeElapsed / 60))) * digestionOfDrink.digestionFactor
        
        if currentBac < 0.0 { currentBac = 0.0 }
    }
    
    func checkIfDrinkIsOutOfSystem() -> Bool {
        if (currentBac == 0.0 && digestionOfDrink.digestionFactor == 1) {
            return true
        } else {
            return false
        }
    }
}
