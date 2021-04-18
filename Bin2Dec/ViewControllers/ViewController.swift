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
        
        view.addGradient(startPointColor: startColor, endPointColor: endColor)
        view.bringSubviewToFront(mainStackView)
        
        
    }
    
    @IBAction func getAnswer() {
        // create an integer array
        guard let binChars = binTextField.text else { return }
        var bins = [Int]()
        
        binChars.forEach { (value) in
            bins.append(value.wholeNumberValue!)
        }
        
        // convert bin to tec
        var dec = Int()
        var power = bins.count - 1
        
        for number in bins {
            dec += number * NSDecimalNumber(decimal: pow(2, power)).intValue
            power -= 1
        }
        
        decLabel.text = String(dec)
    }
    
}




