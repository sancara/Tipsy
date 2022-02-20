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
    
    var tipsyBrain = TipsyBrain()
    
    var tipAmount:Float = 1.0
    var splitedBy:Float = 2.0
    var totalPerPerson:Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.currentTitle == "10%" {
            
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipAmount += 0.1
            
        } else if sender.currentTitle == "20%"{
            
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipAmount += 0.2
            
        } else {
            
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount += 0.0
        }
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let currentValue = String(format: "%.0f", sender.value)
        splitNumberLabel.text = currentValue
        splitedBy = Float(currentValue) ?? splitedBy
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total:Float = Float(billTextField.text ?? "0.0")!
        
        totalPerPerson = tipsyBrain.calculateTotalPerPerson(total: total, tip: tipAmount, numPerson: splitedBy)
        self.performSegue(withIdentifier: "goToDivide", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDivide" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = totalPerPerson
        }
    }
    
}

