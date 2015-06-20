//
//  MyButton.swift
//  Adolfo Says
//
//  Created by Segun Konibire on 17/06/2015.
//  Copyright (c) 2015 Segun Konibire. All rights reserved.
//

import Foundation
import UIKit

class MyCustomButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.0
        self.backgroundColor = UIColorFromRGB(0x8B4513)
        self.tintColor = UIColor.whiteColor()
        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
        
    }
    
}
