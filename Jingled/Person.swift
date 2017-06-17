//
//  Person.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

class Person {
    
    private let gender: Bool! // True for male, False for Female
    private let weight: Double!
    private let bodyWaterConstant: Double!
    private(set) var totalBac = 0.0 // BAC
    
    private var currentStomachContents = CurrentStomachContents(initialDigestionTime: 30)
    private var bacFromDrinks = [BACFromDrink]()
    
    init(gender: Bool, weight: Double) {
        self.gender = gender
        self.weight = weight * 0.453592 // Assumed to be taken in as pounds for US, converted to kilograms
        self.bodyWaterConstant = gender ? 0.58 : 0.49 // 0.58 for male. 0.49 for female
    }
    
    // If person eats food
    func addFood(withDigestionTimeOf: Double) {
        currentStomachContents.changeDigestionTime(to: withDigestionTimeOf)
    }
    
    // If person drinks alcohol
    func addAlcohol(withVolumeOf: Double, andAlcoholContentOf: Double) {
        let drink = Drink(alcoholByVolume: andAlcoholContentOf, volumeOfDrink: withVolumeOf)
        let standardDrinks = drink.numOfStandardDrinks
        
        let digestionOfDrink = DigestionOfDrink(digestionTime: currentStomachContents.digestionTime)
        
        let newBac = BACFromDrink(standardDrinks: standardDrinks, digestionOfDrink: digestionOfDrink, bodyWaterConstant: bodyWaterConstant, weight: weight)
        
        bacFromDrinks.append(newBac)
    }
    
    
    
    func updateBody(timeElapsed: Double) {
        currentStomachContents.updateInfo(timeElapsed: timeElapsed)
        totalBac = 0.0
        for bacOfDrink in bacFromDrinks {
            bacOfDrink.updateInfo(timeElapsed: timeElapsed)
            totalBac += bacOfDrink.currentBac
        }
        removeDrinksOutOfSystem()
    }
    
    private func removeDrinksOutOfSystem() {
        bacFromDrinks = bacFromDrinks.filter({ $0.checkIfDrinkIsOutOfSystem() == false })
    }
    
}
