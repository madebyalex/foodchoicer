//
//  ViewController.swift
//  foodchoicer
//
//  Created by Alexander on 04.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let burgerTime = 15
    let hotdogTime = 12
    let soupTime = 30
    let pizzaTime = 25
    let tacoTime = 40
    let cocktailTime = 5
    
    let mealTimes = ["burger": 15, "hotdog": 12, "soup": 30, "pizza": 25, "taco": 40, "cocktail": 5]
    
    @IBAction func mealSelected(_ sender: UIButton) {
        let meal = sender.currentTitle!.lowercased()
        print(mealTimes[meal]!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

