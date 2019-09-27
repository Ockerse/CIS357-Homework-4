//
//  ConverterButton.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/27/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ConverterButton: UIButton {
    
    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        self.tintColor = BACKGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
    }
}
