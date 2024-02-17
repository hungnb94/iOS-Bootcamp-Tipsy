//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Hung Ba on 05/02/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var settingsLabel: UILabel!

    var totalPerPerson: Float = 0
    var split: Int = 0
    var tip: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalPerPerson)
        settingsLabel.text = "Split between \(split) people with \(Int(tip * 100))% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
