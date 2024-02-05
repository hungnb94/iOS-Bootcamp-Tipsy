//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if zeroPctButton != sender {
            zeroPctButton.isSelected = false
        }
        if tenPctButton != sender {
            tenPctButton.isSelected = false
        }
        if twentyPctButton != sender {
            twentyPctButton.isSelected = false
        }
        if (!sender.isSelected) {
            sender.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tip = getTip()
        print("Tip: \(tip)")
        print("Split: \(splitNumberLabel.text)")
    }
    
    func getTip() -> Float {
        if zeroPctButton.isSelected {
            return 0
        }
        if tenPctButton.isSelected {
            return 0.1
        }
        if twentyPctButton.isSelected {
            return 0.2
        }
        fatalError("No tip selected")
    }
    
}

