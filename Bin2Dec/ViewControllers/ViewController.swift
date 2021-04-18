//
//  ViewController.swift
//  Bin2Dec
//
//  Created by Artiom Poluyanovich on 12.04.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    
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


}

