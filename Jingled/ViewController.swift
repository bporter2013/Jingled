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
        
        let d1 = Drink(alcoholByVolume: 0.05, volumeOfDrink: 16)
        print(d1.alcoholMass)
    }

    
}

