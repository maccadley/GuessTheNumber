//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Admin on 21.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit
class MainViewController: UIViewController {
    
    @IBOutlet weak var attemptsTextLabel: UILabel!
    @IBOutlet weak var playerGuess: UITextField!
    @IBOutlet weak var guessTip: UILabel!
    @IBOutlet weak var victoryText: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    var attempts = 0
    var attemptsAll = 0
    var gamesPlayed = 0
    var bestRow = 0
    var fromNumber = 0
    var toNumber = 100
    var game = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        }


    func startGame(){
        game = Int.random(in: fromNumber...toNumber)
        victoryText.isHidden = true
        restartButton.isHidden = true
        guessTip.isHidden = true
    }
    
    func restartGame(){
        startGame()
        attempts = 0
        gamesPlayed += 1
        playerGuess.text = "\(fromNumber)-\(toNumber)"
        playerGuess.isSelected = false
        attemptsTextLabel.text = NSLocalizedString("Attempts: 0", comment: "When restart the game")
    }
  
    @IBAction func checkNumber(_ sender: UIButton) {
        attempts += 1
        attemptsAll += 1
        guessTip.isHidden = false
        attemptsTextLabel.text = NSLocalizedString("Attempts: \(attempts)", comment: "number of attempts count")
        //Need To refector this part.
        guard let checkIt = playerGuess.text else {return}
        guard let guess = Int(checkIt) else {return}
        switch guess {
        case let check where check < game:
             guessTip.text = NSLocalizedString("HIGHER", comment: "Higher?")
        case let check where check > toNumber || check < fromNumber:
        guessTip.text = NSLocalizedString("Out of Range", comment: "out?")
        case let check where check > game:
            guessTip.text = NSLocalizedString("LOWER", comment: "Lower?")
        case let check where check == game:
            victoryText.isHidden = false
            restartButton.isHidden = false
            checkButton.isHidden = true
            guessTip.isHidden = true
            if bestRow == 0 {
                bestRow = attempts
            } else if bestRow > attempts{
                bestRow = attempts
            }
            game = Int.random(in: fromNumber...toNumber)
        default:
            break
        }
}
    
    @IBAction func pushToSettingsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "settings", sender: nil)
    }

    @IBAction func pushToStatcButton(_ sender: UIButton) {
        performSegue(withIdentifier: "statsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "settings"){
            let showSettingVC = segue.destination as! SettingsVC
            showSettingVC.delegate = self
            showSettingVC.fromNumber = fromNumber
            showSettingVC.toNumber = toNumber
        } else if (segue.identifier == "statsVC"){
            let showStatsVC = segue.destination as! StatsVC
            showStatsVC.attempts = attemptsAll
            showStatsVC.gamesPlayed = gamesPlayed
            showStatsVC.bestRow = bestRow
        }
    }
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        restartGame()
        checkButton.isHidden = false
    }
}

