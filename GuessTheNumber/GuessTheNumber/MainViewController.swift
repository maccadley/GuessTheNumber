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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        victoryText.isHidden = true
        restartButton.isHidden = true
    }

  var game = Int.random(in: 0...100)
  

    @IBAction func checkNumber(_ sender: UIButton) {
        print(game)
        attempts += 1
        attemptsAll += 1
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
            if bestRow == 0 {
                bestRow = attempts
            } else if bestRow > attempts{
                bestRow = attempts
            }
            game = Int.random(in: 0...100)
            print(game)
        default:
            break
        }
}
    
    
    var test = "Something"
    
    @IBAction func pushToSettingsButton(_ sender: UIButton) {
        // Don't get why this doesn't pass data. better use Segue, 'cause it works
//       let settingVc = SettingsVC(nibName: "SettingsVC", bundle: nil)
//        settingVc.testText = test
//        navigationController?.pushViewController(settingVc, animated: true)
        performSegue(withIdentifier: "settings", sender: nil)
    }

    
    @IBAction func pushToStatcButton(_ sender: UIButton) {
//        let statsVc = StatsVC(nibName: "StatsVC", bundle: nil)
//        navigationController?.pushViewController(statsVc, animated: true)
        performSegue(withIdentifier: "statsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "settings"){
            let showSettingVC = segue.destination as! SettingsVC
            showSettingVC.testText = test
            showSettingVC.delegate = self
        } else if (segue.identifier == "statsVC"){
            let showStatsVC = segue.destination as! StatsVC
            showStatsVC.test = test
            showStatsVC.attempts = attemptsAll
            showStatsVC.gamesPlayed = gamesPlayed
            showStatsVC.bestRow = bestRow
        }
        
    }
    
    
    @IBAction func restartButtonAction(_ sender: UIButton) {
        victoryText.isHidden = true
        restartButton.isHidden = true
        checkButton.isHidden = false
        attempts = 0
        gamesPlayed += 1
        //attemptsText.text = "Attempts: 0"
        attemptsTextLabel.text = NSLocalizedString("Attempts: 0", comment: "When restart the game")
        playerGuess.text = "0 - 100"
    }
    
    
}

