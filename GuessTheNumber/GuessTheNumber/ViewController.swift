//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Admin on 21.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var attemptsTextLabel: UILabel!
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

  var game = Int.random(in: 0...100)

    @IBAction func checkNumber(_ sender: UIButton) {
        print(game)
        attempts += 1
        attemptsTextLabel.text = NSLocalizedString("Attempts: \(attempts)", comment: "number of attempts count")
        //Need To refector this part.
        guard let checkIt = playerGuess.text else {return}
        guard let guess = Int(checkIt) else {return}
        switch guess {
        case let check where check < game:
             guessTip.text = NSLocalizedString("HIGHER", comment: "Higher?")
        case let check where check > game:
            guessTip.text = NSLocalizedString("LOWER", comment: "Lower?")
        case let check where check == game:
            victoryText.isHidden = false
            restartButton.isHidden = false
            checkButton.isHidden = true
            game = Int.random(in: 0...100)
            print(game)
        default:
            break
        }
}
    
    
    var test = "test1"
    @IBAction func pushToSettingsButton(_ sender: UIButton) {
       let settingVc = SettingsVC(nibName: "SettingsVC", bundle: nil)
        settingVc.text = "not test"
        
        navigationController?.pushViewController(settingVc, animated: true)
    
    }
    
    
    @IBAction func pushToStatcButton(_ sender: UIButton) {
    }
    
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        victoryText.isHidden = true
        restartButton.isHidden = true
        checkButton.isHidden = false
        attempts = 0
        //attemptsText.text = "Attempts: 0"
        attemptsTextLabel.text = NSLocalizedString("Attempts: 0", comment: "When restart the game")
        playerGuess.text = "0 - 100"
    }
    
    
}

