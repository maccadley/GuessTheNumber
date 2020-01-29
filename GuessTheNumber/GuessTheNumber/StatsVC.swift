//
//  StatsVC.swift
//  GuessTheNumber
//
//  Created by Admin on 29.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit

class StatsVC: UIViewController {

    var test = ""
    var gamesPlayed = 0
    var attempts = 0
    var bestRow = 0
    
    @IBOutlet weak var gamesPlayedLabelText: UILabel!
    @IBOutlet weak var bestRowLabelText: UILabel!
    @IBOutlet weak var attemptsLabelText: UILabel!
    @IBOutlet weak var testLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabelText.text = test
        gamesPlayedLabelText.text = String(gamesPlayed)
        attemptsLabelText.text = String(attempts)
        bestRowLabelText.text = String(bestRow)
    }
    

   

}
