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
    
    @IBAction func mealSelected(_ sender: UIButton) {
        let meal = sender.currentTitle!.lowercased()
        
        switch meal {
            case "burger":
                print(burgerTime)
            case "hotdog":
                print(hotdogTime)
            case "soup":
                print(soupTime)
            case "pizza":
                print(pizzaTime)
            case "taco":
                print(tacoTime)
            case "cocktail":
                print(cocktailTime)
            default:
                print("There is no such meal, sorry")
        }
        
//        let timeName: String = meal + "Time"

//        let varName = NSPredicate(format: "%@", timeName)
        
//        if (String(varName) == timeName) {
//            print(meal)
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

