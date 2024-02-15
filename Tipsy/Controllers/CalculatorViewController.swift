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
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let tip = getTip()
        let bill = Float(billTextField.text!) ?? 0
        let splitBill = bill * (1 + tip)
        print(String(format: "Bill total: %.2f", splitBill / Float(splitNumberLabel.text!)!))
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

