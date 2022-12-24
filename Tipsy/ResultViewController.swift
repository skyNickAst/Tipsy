//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nikolai Astakhov on 25.12.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var willPayEach: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var totalPerPerson: String = ""
    var tip: String = ""
    var persons: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = "Split between \(persons) people, with \(tip) tip."
        resultLabel.text = result
        willPayEach.text = totalPerPerson
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalcButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
