//
//  ViewController.swift
//  calc
//
//  Created by Вадим Гатауллин on 15/10/2018.
//  Copyright © 2018 Вадим Гатауллин. All rights reserved.
//

import UIKit

var x : Double = 0
var y : Double = 0
var z : Double = 0

var enterFlag = 1
var yFlag = 1
var decimalPoint = 0

var power : Int = 1

var operTag : Int = 0
var prevOperTag : Int = 0

class ViewController: UIViewController {

    @IBAction func inverse(_ sender: UIButton) {
        x = -x
        showResults()
    }
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func digitalAction(_ sender: UIButton) {
        
        if enterFlag == 1 {
            x = 0
            z = x
            enterFlag = 0
        }
        if decimalPoint == 0 {
            x = x * 10 + Double(sender.tag)
            z = x
            showResults()
        } else {
            x = x + Double((Double(sender.tag)) / Double(pow(10, Double(power))))
            z = x
            power = power + 1
            showResults()
        }
        
        
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if (sender.tag == 1005) {
            switch operTag {
            case 1001:
                x = y + z
            case 1002:
                x = y - z
            case 1003:
                x = y * z
            case 1004:
                x = y / z
            default:
                print("default")
            }
            enterFlag = 1
            yFlag = 1
            y = x
            decimalPoint = 0
            power = 1
            showResults()
            return
        }

        if enterFlag != 1 && yFlag == 1 {
            switch operTag {
            case 1001:
                x = x + y
            case 1002:
                x = y - x
            case 1003:
                x = y * x
            case 1004:
                x = y / x
            default:
                print("default")
            }
        }
        if (sender.tag != 1005) {
            prevOperTag = operTag
            operTag = sender.tag
            enterFlag = 1
            yFlag = 1
            y = x
            decimalPoint = 0
            power = 1
        } else {
            prevOperTag = operTag
        }
        showResults()
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if decimalPoint == 0 {
            decimalPoint = 1
            self.resultLabel.text = self.resultLabel.text! + "."
        }
    }
    @IBAction func ACButton(_ sender: UIButton) {
        x = 0
        y = 0
        z = 0
        
        enterFlag = 1
        yFlag = 1
        decimalPoint = 0
        
        power = 1
        operTag = 0
        showResults()
        
    }
    
    func showResults() {
        let temp = Double(x - Double(Int(x)))
        if (temp.isZero){
            self.resultLabel.text = " " + String(Int64(x))
        }
        else {
            self.resultLabel.text = " " + String(format:"%.1f", x)
        }
    }
    
}

