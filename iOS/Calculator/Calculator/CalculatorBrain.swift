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
    
    var operations: Dictionary<String, Double> = [
        "π" : Double.pi,
        "e" : M_E,
        "⎷" : sqrt,
        "cos" : cos`
    ]
    
    func performOperation(symbol: String) {
        if let contant = operations[symbol] {
            accumulator = contant
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
