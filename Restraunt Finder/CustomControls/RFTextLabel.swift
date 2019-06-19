//
//  RFTextField.swift
//  Restraunt Finder
//
//  Created by Rishabh Raj on 25/05/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class RFTextLabel : UITextField {
    init(frame: CGRect = .zero, text : String = "Default",fontName : String = "Poppins-Regular", fontSize : CGFloat = 16) {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false 
        }
        self.font = UIFont.init(name: fontName, size: fontSize)
        self.text = text
        self.textColor = .white 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
