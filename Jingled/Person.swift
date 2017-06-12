//
//  Person.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import Foundation

class Person {
    private let _gender: Bool! // True for male, False for Female
    private let _weight: Double!
    private let _bodyWaterConstant: Double!
    private var _totalBac = 0.0 // BAC
    private var _drinksInBody: [DrinkInBody] // Contains drinks still in system
    
    init(gender: Bool, weight: Double) {
        _gender = gender
        _weight = weight * 0.453592 // Assumed to be taken in as pounds for US, converted to kilograms
        _bodyWaterConstant = gender ? 0.58 : 0.49 // 0.58 for male. 0.49 for female
    }
    
    
    var bodyWaterConstant: Double { return _bodyWaterConstant }
    var weight: Double { return _weight }
    
    func addAlcohol(of drink: Drink, amountOfFoodBeforeDrinking: Double) {
        let standardDrinks = drink.numOfStandardDrinks
        let intialBAC = calcualteBloodAlcoholContent(of: standardDrinks, timeElapsed: 0.0)
        //_drinksInBody.append((intialBAC, 0.0, standardDrinks))
        updateBacOfBody(timeElapsed: 0.0)
    }
    
    
    
    func updateBacOfBody(timeElapsed: Double) {
        for (var drink) in _drinksInBody {
            drink.1 =  drink.1 + timeElapsed
            let newBac = calcualteBloodAlcoholContent(of: drink.2, timeElapsed: drink.1)
            drink.0 = newBac
        }
        //removeDrinksOutOfSystem()
        calculateTotalBAC()
    }
    
    // Doesn't work yet
//    private func removeDrinksOutOfSystem() {
//        for i in 0..<_drinksInBody.count {
//            print(i)
//            _drinksInBody.remove(at: i)
//        }
//    }
    
    private func calculateTotalBAC() {
        _totalBloodAlcoholContent = 0.0
        for drink in _drinksInBody {
            _totalBloodAlcoholContent += drink.0
        }
    }
    
    var bloodAlcoholContent: Double {
        return _totalBloodAlcoholContent
    }
    
}
