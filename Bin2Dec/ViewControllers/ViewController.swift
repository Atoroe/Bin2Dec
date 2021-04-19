//
//  ViewController.swift
//  Bin2Dec
//
//  Created by Artiom Poluyanovich on 12.04.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var binTextField: UITextField!
    @IBOutlet weak var decLabel: UILabel!
    @IBOutlet weak var solveButton: UIButton!
    
    let startColor = UIColor(red: 255/255,
                             green: 224/255,
                             blue: 68/255,
                             alpha: 1)
    let endColor = UIColor(red: 247/255,
                           green: 116/255,
                           blue: 116/255,
                           alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMenu()
        binTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func getAnswer() {
        guard let binChars = binTextField.text else { return }
        var dec = Int()
        var power = binChars.count - 1
        binChars.forEach { (binValue) in
            dec += binValue.wholeNumberValue! * NSDecimalNumber(decimal: pow(2, power)).intValue
            power -= 1
        }
        decLabel.text = String(dec)
    }
    
}

//MARK: private methods
extension ViewController {
    private func initMenu() {
        view.addGradient(startPointColor: startColor, endPointColor: endColor)
        view.bringSubviewToFront(mainStackView)
        solveButton.roundCorners()
        solveButton.dropShadow()
        binTextField.dropShadow()
    }
}
//MARK: textField extensions
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet(charactersIn: "23456789")) == nil
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count == 8 {
            view.endEditing(true)
        }
        if textField.text!.isEmpty {
            decLabel.text = "Enter binary number"
        }
    }
}






