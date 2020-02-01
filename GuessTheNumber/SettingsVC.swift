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
    
    
    @IBAction func setRangeButton(_ sender: UIButton) {
        guard let fromText = Int(fromTextInput.text ?? "0") else {return}
        guard let toText = Int(toTextInput.text ?? "100") else {return}
        delegate.fromNumber = fromText
        delegate.toNumber = toText
        delegate.restartGame()
        dismiss(animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        delegate.fromNumber = fromNumber
//        delegate.toNumber = toNumber
//    }
    

}
