//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Hung Ba on 17/02/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var bill: Bill

    init(bill: Bill) {
        self.bill = bill
    }

    func setTip(tip: Float) {
        bill.tip = tip
    }

    func setTotal(total: Float) {
        bill.total = total
    }

    func setSplit(split: Int) {
        bill.split = split
    }

    func getTotalPerPerson() -> Float {
        return bill.total * (1 + bill.tip) / Float(bill.split)
    }

    func getSplit() -> Int {
        return bill.split
    }

    func getTip() -> Float {
        return bill.tip
    }
}
