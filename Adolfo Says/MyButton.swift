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
        
        self.layer.cornerRadius = 4.0;
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.5
        //self.backgroundColor = UIColorFromRGB(0x8B4513)
        self.backgroundColor = UIColor.whiteColor()
        //self.layer.opacity = 0.3
        self.tintColor = UIColor.blackColor()
        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(0.6)
        )
        
    }
    
}
