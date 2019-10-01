//
//  ViewController.swift
//  Calculator
//
//  Created by KangSH on 25/09/2019.
//  Copyright © 2019 KangSH. All rights reserved.
//

// swift는 여러 개의 클래스를 묶어서 모듈이라는 형태로 만들 수 있음.
import UIKit // UIKit 모듈
//UI로부터 독립적인 Model에는 Foundation을 import함. Foundation은 Core Service

// 모든 MVC Controller는 UIViewController를 상속 받아햐하고
// Swift는 단일 상속 언어이다.
class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel! // = nil
    
    // false는 무조건 Bool이므로 타입 추론
    var userIsInTheMiddleOfTyping/* : Bool */ = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        // String? => Optional String
        // 타입은 Optional이고 Optional 타입은 두 가지의 값을 가질 수 있는데
        // nil(not set, 포인터도 0도 아닌 아무것도 set되지 않았다는 의미), 그리고 set(asscociated value)이다.
        // 이때 asscociated value가 String이 되는 것이다.
        
        // Swift는 타입 추론 언어이므로 var let에 상관없이 할당해주면 된다.
        
        // !를 붙이면 asscociated value를 꺼내온다.
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
       if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(M_PI) // M_PI
            }
       }
    }
    
}

