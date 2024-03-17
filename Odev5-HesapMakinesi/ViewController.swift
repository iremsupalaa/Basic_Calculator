//
//  ViewController.swift
//  Odev5-HesapMakinesi
//
//  Created by İremsu Pala on 4.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var workings : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Result"
    }
    func clearAll() {
        workings = ""
        operationLabel.text = ""
        resultLabel.text = "result: "
    }
    
    @IBAction func equalsButton(_ sender: Any) {
        if(validInput()) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message:"Calculator unabled to do math based on input" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
       
        
    }
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous : Int = -1
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            if(index == workings.count - 1) {
                return false
            }
            if(previous != -1) {
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        return false
    }
    func formatResult(result : Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)

        }
    }
    
    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
    }
    @IBAction func backButton(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            operationLabel.text = workings
        }
    }
    func addToWorkings(value: String) {
        workings = workings + value
        operationLabel.text = workings
    }
    
    @IBAction func percentageButton(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func ejectButton(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func sevenButton(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addToWorkings(value: "8")
    }
   
    @IBAction func nineButton(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func oneButton(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addToWorkings(value: "0")
    }
}
       
