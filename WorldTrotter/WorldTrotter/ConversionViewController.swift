//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Bart Jung on 18/11/2017.
//  Copyright © 2017 Bart Jung. All rights reserved.
//

//import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
       let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    func updateCelciusLabel() {
        if let value = celsiusValue {
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.string(from: value as NSNumber)
        }
        else {
            celsiusLabel.text = "???"
        }
        print("Celcius Label updated")
    } 
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        //celsiusLabel.text = textField.text
        /*
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }
        else {
            celsiusLabel.text = "???"
        }
         */
        
        /*
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
        */
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = number.doubleValue
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        // Bronze Challenge
        let hasDecimal = string.rangeOfCharacter(from: NSCharacterSet.letters)
        if hasDecimal != nil {
            return false
        }
        
        // Bronze Challenge another solution
        /*
        let mySet = NSCharacterSet.decimalDigits
        for c in string.unicodeScalars {
            if c == "." {
                break
            }
            if mySet.contains(c) {
                return true
            } else {
                return false
            }
        }
        */
        
        //let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        //let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        // apply localization
        let decimalSeparator = NSLocale.current.decimalSeparator
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator!)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator!)
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            return true
        }
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
    // Silver Challenge: Dark Mode
    override func viewWillAppear(_ animated: Bool) {
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        print("hour : \(hour)")
        if hour > 18 || hour < 6 {
            self.view.backgroundColor = UIColor.gray
        }
    }
}





