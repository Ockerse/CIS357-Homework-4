//
//  ViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/17/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ViewController: ConverterViewController, UITextFieldDelegate, SettingsViewControllerDelecate{
    @IBOutlet weak var fromField: DecimalMinusTextField!
    @IBOutlet weak var toField: DecimalMinusTextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    
   
    var unit = CalculatorMode.Length
    var toLength = LengthUnit.Yards
    var fromLength = LengthUnit.Yards
    
    var toVolume = VolumeUnit.Gallons
    var fromVolume = VolumeUnit.Gallons
    
    var getLength = LengthConversionKey.init(toUnits: .Meters, fromUnits: .Yards)
    
    var getVolume = VolumeConversionKey.init(toUnits: .Liters, fromUnits: .Gallons)
    
    var ans = 0.0
    var cons = 0.0
    
    var mode : CalculatorMode?
    var whatMode: Int = 1
    var currentCalcMode = CalculatorMode.Length
    
    func settingsChanged(from: String, to: String) {
       
        var m = "length"
        if mode == CalculatorMode.Volume {
            m = "volume"
        }
        unitsSelection(from: from, to: to, mode: m)
    }

    func unitsSelection(from: String, to: String, mode: String) {
        self.fromLabel!.text = from
        self.fromField!.placeholder = "Enter " + mode + " in " + fromLabel!.text!
        self.toLabel!.text = to
        self.toField!.placeholder = "Enter " + mode + " in " + toLabel!.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let d = segue.destination.children[0] as? SettingViewController{
            d.whichMode = whatMode
            d.fromStr = fromLabel.text!
            d.toStr = toLabel.text!
            d.delegate = self
            
            if unit == .Length{
                d.mode = unit
            }else{
                d.mode = unit
            }
        }else{
            print("IT BROKE AGAIN")
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        toField.text = ""
        fromField.text = ""
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        currentMode()
    }
    @IBAction func modePressed(_ sender: UIButton) {
        
        if (currentCalcMode == CalculatorMode.Length){
            currentCalcMode = CalculatorMode.Volume
            whatMode = 2
            mode = CalculatorMode.Volume
            titleLabel.text = "Volume Conversion Calculator"
            fromLabel.text = "Liters"
            toLabel.text = "Gallons"
            unitsSelection(from: "Liters", to: "Gallons", mode: "volume")
        }
        else if currentCalcMode == CalculatorMode.Volume {
            currentCalcMode = CalculatorMode.Length
            whatMode = 1
            mode = CalculatorMode.Length
            titleLabel.text = "Length Conversion Calculator"
            fromLabel.text = "Yards"
            toLabel.text = "Meters"
            unitsSelection(from: "Yards", to: "Meters", mode: "length" )
        }
    }
    

    func currentMode(){
        switch fromLabel.text{
        case "Yards":
            fromLength = .Yards
        case "Meters":
            fromLength = .Meters
        case "Miles":
            fromLength = .Miles
        case "Gallons":
            fromVolume = .Gallons
        case "Liters":
            fromVolume = .Liters
        case "Quarts":
            fromVolume = .Quarts
        default:
            print("There is an error")
        }
        
        switch toLabel.text{
        case "Yards":
            toLength = .Yards
        case "Meters":
            toLength = .Meters
        case "Miles":
            toLength = .Miles
        case "Gallons":
            toVolume = .Gallons
        case "Liters":
            toVolume = .Liters
        case "Quarts":
            toVolume = .Quarts
        default:
            print("There is an error")
        }
        
        if titleLabel.text == "Length Conversion Calculator"{
            unit = .Length
        }else{
            unit = .Volume
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        currentMode()
        dismissKeyboard()
        if !(fromField.text?.isEmpty)! && !(toField.text?.isEmpty)! {
            print("Error, cannot have both boxes filled")
        }
        
        else if unit == CalculatorMode.Length && !((fromField.text?.isEmpty)!) {
            if toLength == .Meters {
                getLength = LengthConversionKey.init(toUnits: toLength, fromUnits: fromLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
                
            else if toLength == .Miles {
                getLength = LengthConversionKey.init(toUnits: toLength, fromUnits: fromLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
                
            else if toLength == .Yards {
                getLength = LengthConversionKey.init(toUnits: toLength, fromUnits: fromLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
            
            toField.text = String(ans)
            
        }
            
        else if unit == CalculatorMode.Length && !((toField.text?.isEmpty)!){
            if toLength == .Meters {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
                
            else if toLength == .Miles {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
                
            else if toLength == .Yards {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
            
            fromField.text = String(ans)
        }
            
        else if unit == CalculatorMode.Volume && !((fromField.text?.isEmpty)!) {
            if fromVolume == .Gallons{
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                ans = cons * Double(fromField.text!)!
            }
            else if fromVolume == .Liters{
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(fromField.text!)!
            }
            else if fromVolume == .Quarts{
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(fromField.text!)!
            }
    
            
            toField.text = String(ans)
        }
            
        else if unit == CalculatorMode.Volume && !((toField.text?.isEmpty)!) {
            if toVolume == .Gallons{
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                ans = cons * Double(toField.text!)!
            }
            else if toVolume == .Liters{
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                ans = cons * Double(toField.text!)!
            }
            else if toVolume == .Quarts{
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                ans = cons * Double(toField.text!)!
            }
            
            fromField.text = String(ans)
        }
            
        else {
            print("Error")
        
    }
    
 


 }
    
}
extension UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
}
}
