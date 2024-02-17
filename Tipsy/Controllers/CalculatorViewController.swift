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
    var calculatorBrain = CalculatorBrain(bill: Bill(total: 0, tip: 0.1, split: 2))
    
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
        calculatorBrain.setTip(tip: self.getTip())
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let split = Int(sender.value)
        splitNumberLabel.text = "\(split)"
        billTextField.endEditing(true)
        calculatorBrain.setSplit(split: split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Float(billTextField.text!) ?? 0
        calculatorBrain.setTotal(total: total)
        self.performSegue(withIdentifier: "ResultsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ResultsViewController") {
            let controller = segue.destination as! ResultsViewController
            controller.totalPerPerson = calculatorBrain.getTotalPerPerson()
            controller.split = calculatorBrain.getSplit()
            controller.tip = calculatorBrain.getTip()
        }
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

