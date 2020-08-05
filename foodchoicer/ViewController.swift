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
    var isReady = false
    
    @IBAction func mealSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.setProgress(0, animated: true)
        progressBar.alpha = 0
        isReady = false
            
        meal = sender.currentTitle!.lowercased()
        totalTime = mealTimes[meal]!
        
        headline.text = "Cooking \(meal)... ⏱"
        descriptionLbl.text = "Your order is accepted."
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.progressBar.alpha = 1
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            var timePercent: Float = 1
            
            if isReady == false {
              descriptionLbl.text = "Please wait \(totalTime - secondsPassed) seconds"
            }
            secondsPassed += 1
            
            timePercent = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(Float(timePercent), animated: true)
            
//            print(timePercent)
//            print(secondsPassed)
            
        } else {
            headline.text = "Yay! 🙌"
            descriptionLbl.text = "Enjoy your \(meal)."
            isReady = true
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.progressBar.setProgress(1, animated: true)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.timer.invalidate()
                self.progressBar.alpha = 0
            }
        }
        
        if isReady == true {
            secondsPassed = 0
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.layer.cornerRadius = 4
    }


}

