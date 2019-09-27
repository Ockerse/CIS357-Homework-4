//
//  ViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/17/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fromField: DecimalMinusTextField!
    @IBOutlet weak var toField: DecimalMinusTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clearButtonPressed(_ sender: UIButton) {
        toField!.text = ""
        fromField.text = ""
    }
}

