//
//  PickerViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/18/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var mode : CalculatorMode?
    var save : Bool?
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var fromSelect: UIButton!
    @IBOutlet weak var toSelect: UIButton!
    var selection : String = "Yards"
    var selection2 : String = "Meters"
    var whichLabel : Bool?
    var pickerData : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.becomeFirstResponder()
        
        super.viewDidLoad()
        
        if mode == .Volume {
            selection = "Gallons"
            selection2 = "Liters"
            
            fromSelect.setTitle("Gallons", for: UIControl.State.normal)
            toSelect.setTitle("Liters", for: UIControl.State.normal)
        }
        
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.save = false
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        self.save = true
        self.viewWillDisappear(true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func fromSelectButtonPressed(_ sender: Any) {
        self.pickerView.isHidden = false
        whichLabel = true
        if mode! == .Length {
            self.pickerData = ["Yards", "Meters", "Miles"]
            
        }
            
        else {
            self.pickerData = ["Gallons", "Liters", "Quarts"]
            
        }
        self.pickerView.delegate = (self as! UIPickerViewDelegate)
        self.pickerView.dataSource = (self as! UIPickerViewDataSource)
    }
    
    @IBAction func toSelectButtonPressed(_ sender: Any) {
    }
    
  
}
