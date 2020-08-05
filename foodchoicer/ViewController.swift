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
    @IBOutlet weak var progressBar: UIProgressView!
    
    
//    let mealTimes = ["burger": 300, "hotdog": 420, "soup": 1200, "pizza": 900, "taco": 1500, "cocktail": 720]
    
    let mealTimes = ["burger": 3, "hotdog": 4, "soup": 5, "pizza": 7, "taco": 6, "cocktail": 8]
    
    var meal = ""
    var timer = Timer()
    var totalTime = 10
    var secondsPassed = 0
    
    @IBAction func mealSelected(_ sender: UIButton) {
        
        timer.invalidate()
        headline.text = "Cooking... ⏱"
        progressBar.alpha = 1
            
        meal = sender.currentTitle!.lowercased()
        totalTime = mealTimes[meal]!
        
        descriptionLbl.text = "Your order is accepted."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            var timePercent: Float = 1
            
            descriptionLbl.text = "Please wait \(totalTime - secondsPassed) seconds"
            
            timePercent = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(Float(timePercent), animated: true)
            
            secondsPassed += 1
            
        } else {
            headline.text = "Yay! 🙌"
            descriptionLbl.text = "Enjoy your \(meal)."
            progressBar.setProgress(1, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.layer.cornerRadius = 4
    }


}

