//
//  ViewController.swift
//  Tipsy
//
//  Created by Nikolai Astakhov on 24.12.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var billTextFieldOutlet: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    
    var bill = 0.0
    var tip = 0.1
    var persons = 1.0
    var finalResult = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        billTextFieldOutlet.endEditing(true)
    }
    
    @IBAction func percentageSliderChanged(_ sender: UISlider) {
        tip = Double(round(100 * sender.value) / 100)
        let a = sender.value * 100
        let prcString = String(format: "%.0f", a)
        tipPercentageLabel.text = "\(prcString) %"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        persons = Double(sender.value)
        numOfPeopleLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if billTextFieldOutlet.text != "" {
            billTextFieldOutlet.placeholder = "e.g. 150.50"
            bill = Double(billTextFieldOutlet.text!)!
            let result = ((bill * tip) + bill) / persons
            finalResult = String(format: "%.2f", result)
            performSegue(withIdentifier: "toResult", sender: self)
        } else {
            billTextFieldOutlet.placeholder = "Enter the amount of your bill..."
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = finalResult
            destinationVC.tip = tipPercentageLabel.text!
            destinationVC.persons = String(format: "%.0f", persons)
        }
    }
}
