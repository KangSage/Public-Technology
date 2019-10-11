//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by SEONGHYEON KANG on 10/10/2019.
//  Copyright © 2019 KangSH. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "π": accumulator = Double.pi
        case "⎷": accumulator = sqrt(accumulator)
        default: break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
