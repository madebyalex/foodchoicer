//
//  ViewController.swift
//  foodchoicer
//
//  Created by Alexander on 04.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mealTimes = ["burger": 300, "hotdog": 420, "soup": 1200, "pizza": 900, "taco": 1500, "cocktail": 720]
    
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func mealSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let meal = sender.currentTitle!.lowercased()
        secondsRemaining = mealTimes[meal]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("Remaining \(secondsRemaining) seconds")
            secondsRemaining -= 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

