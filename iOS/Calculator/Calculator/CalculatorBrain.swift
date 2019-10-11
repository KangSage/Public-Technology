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
    
    var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "⎷" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos)
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
                case .Constant(let value): accumulator = value
                case .UnaryOperation(let function): accumulator = function(accumulator)
                case .BinaryOperation: break
                case .Equals: break
                default: break
            }
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
