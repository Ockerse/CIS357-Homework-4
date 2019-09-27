//
//  ConverterTextField.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/27/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit


import UIKit

class ConverterTextField: DecimalMinusTextField {
    
    override func awakeFromNib() {
        
        self.tintColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        
        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor :
                FOREGROUND_COLOR])
    }
}
