//
//  Chain+UIVIew.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit


extension UIView {
    func backgroundColor(_ code : ColorCode) -> Self {
        self.backgroundColor = .setCustomColor(code)
        return self
    }
    
    func addView(_ view : UIView) -> Self {
        self.addSubview(view)
        return self
    }
    
    func autoAddview(_ views: [UIView]) -> Self {
        views.forEach {
            self.addSubview($0)
        }
        return self
    }
    
    func cornerRadius(_ float : CGFloat) -> Self {
        self.cornerRadius = float
        return self
    }
    
    func borderWidth(_ float : CGFloat) -> Self {
        self.borderWidth = float
        return self
    }
    
    func borderColor(_ code : ColorCode) -> Self {
        self.borderColor = .setCustomColor(code)
        return self
    }
    
    func isHidden(_ isHidden : Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
}
