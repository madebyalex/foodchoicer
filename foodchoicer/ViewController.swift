//
//  ViewController.swift
//  foodchoicer
//
//  Created by Alexander on 04.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var headline: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    
//    let mealTimes = ["burger": 300, "hotdog": 420, "soup": 1200, "pizza": 900, "taco": 1500, "cocktail": 720]
    
    let mealTimes = ["burger": 3, "hotdog": 4, "soup": 5, "pizza": 7, "taco": 6, "cocktail": 8]
    
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func mealSelected(_ sender: UIButton) {
        
        timer.invalidate()
        headline.text = "Cooking... ⏱"
        
        let meal = sender.currentTitle!.lowercased()
        secondsRemaining = mealTimes[meal]!
        
        descriptionLbl.text = "Your order is accepted."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
//            print("Remaining \(secondsRemaining) seconds")
            descriptionLbl.text = "Please wait \(secondsRemaining) seconds"
            secondsRemaining -= 1
        } else {
            headline.text = "Yay! 🙌"
            descriptionLbl.text = "Enjoy your meal."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

