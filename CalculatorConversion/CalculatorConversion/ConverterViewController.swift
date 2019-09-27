//
//  ConverterViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/27/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = BACKGROUND_COLOR
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
