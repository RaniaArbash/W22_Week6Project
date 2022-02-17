//
//  myCustomButton.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

import UIKit

class myCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = layer.frame.height / 2

        
    }
    
    
    
    

}
