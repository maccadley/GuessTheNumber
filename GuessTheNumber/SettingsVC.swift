//
//  SettingsVC.swift
//  GuessTheNumber
//
//  Created by Admin on 28.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var text = "test"
    var mainController : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewBack = segue.destination as? ViewController{
            viewBack.test = "not test"
        }
    }

}
