//
//  ViewController.swift
//  Jingled
//
//  Created by Brett Porter on 6/10/17.
//  Copyright © 2017 PorterApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = Person(gender: true, weight: 185)
        let d1 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d1)
        p1.updateBacOfBody(timeElapsed: 60)
        print(p1.bloodAlcoholContent)
        /*
        let d2 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d2)
        p1.updateBacOfBody(timeElapsed: 10)
        
        print(p1.bloodAlcoholContent)
        
        let d3 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d3)
        p1.updateBacOfBody(timeElapsed: 10)
        
        print(p1.bloodAlcoholContent)
        
        let d4 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d4)
        p1.updateBacOfBody(timeElapsed: 10)
        
        print(p1.bloodAlcoholContent)
        
        let d5 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d5)
        p1.updateBacOfBody(timeElapsed: 10)
        
        print(p1.bloodAlcoholContent)
        
        let d6 = Drink(alcoholByVolume: 0.043, volumeOfDrink: 12)
        p1.addAlcohol(of: d6)
        p1.updateBacOfBody(timeElapsed: 10)
        
        print(p1.bloodAlcoholContent)*/
    }

    
}

