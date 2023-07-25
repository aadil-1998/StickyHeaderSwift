//
//  SegmentedControllerClass.swift
//  DemoPi
//
//  Created by 2022M19 on 24/07/23.
//

import Foundation
import UIKit

class SegmentedControllerClass: UISegmentedControl {
    
    @IBInspectable var isWhiteBG : Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)]
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isWhiteBG {
            for i in 0...(numberOfSegments - 1)  {
                subviews[i].isHidden = true
            }
        }
    }
}
