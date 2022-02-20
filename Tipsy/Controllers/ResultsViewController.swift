//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Santiago Caraballo on 31/01/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total: Float?
    var numPeople: Float?
    var tip: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", total!)
        // Do any additional setup after loading the view.
        settingsLabel.text = "Split between \(numPeople ?? 0.0) people, with \(tip ?? 0.0)% tip."
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
