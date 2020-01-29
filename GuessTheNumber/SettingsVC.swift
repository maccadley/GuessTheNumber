//
//  SettingsVC.swift
//  GuessTheNumber
//
//  Created by Admin on 28.01.2020.
//  Copyright © 2020 MaximMasov. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var testText = ""
    var fromNumber = 0
    var toNumber = 100
    var delegate: MainViewController!
    @IBOutlet weak var testLabeltext: UILabel!
    
    @IBOutlet weak var fromTextInput: UITextField!
    @IBOutlet weak var toTextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabeltext.text = testText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
//    @IBAction func backButton(_ sender: UIButton) {
//
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewBack = segue.destination as? ViewController{
//            viewBack.test = "not test"
//        }
//    }

}
