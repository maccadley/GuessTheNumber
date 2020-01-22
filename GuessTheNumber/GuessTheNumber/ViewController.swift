//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Admin on 21.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var attemptsText: UILabel!
    @IBOutlet weak var playerGuess: UITextField!
    @IBOutlet weak var guessTip: UILabel!
    @IBOutlet weak var victoryText: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    var attempts = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        victoryText.isHidden = true
        restartButton.isHidden = true
    }

  var game = Int(arc4random_uniform(UInt32(100)))

    @IBAction func checkNumber(_ sender: UIButton) {
        print(game)
        attempts += 1
        attemptsText.text = "Attempts: \(attempts)"
        guard let checkIt = playerGuess.text else {return}
        let guess = Int(checkIt)
        if guess ?? 0 < game{
            guessTip.text = "HIGHER"
        } else if guess ?? 0 > game{
                guessTip.text = "LOWER"
        } else if guess == game {
            victoryText.isHidden = false
            restartButton.isHidden = false
            checkButton.isHidden = true
            game = Int(arc4random_uniform(UInt32(100)))
            print(game)
        }
}
    
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        victoryText.isHidden = true
        restartButton.isHidden = true
        checkButton.isHidden = false
        attempts = 0
        attemptsText.text = "Attempts: 0"
        playerGuess.text = "0 - 100"
    }
    
//    func randomNumberGenerator() -> Int{
//        return Int(arc4random_uniform(UInt32(100)))
//    }
    
    
}

