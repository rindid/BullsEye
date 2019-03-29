//
//  ViewController.swift
//  BullsEye
//
//  Created by Release on 27/03/2019.
//  Copyright © 2019 20151539. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue = 0
    //var currentVal = 50
    var score = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }
    
   /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 어쩌고 저쩌고
    }*/
    
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points"
        
        
        /*let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"*/
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "O.K", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    @IBAction func sliderMoved(_slider: UISlider){
        currentValue = lroundf(slider.value)
        print("The value of the slider is not:\(currentValue)")
    }
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

}

