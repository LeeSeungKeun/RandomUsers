//
//  Chain+UILabel.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit

extension UILabel {
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func textColor(_ code : ColorCode) -> Self {
        self.textColor = .setCustomColor(code)
        return self
    }
    
    @discardableResult
    func numberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    
    @discardableResult
    func boldFont(size : CGFloat) -> Self {
        
        self.font = .boldSystemFont(ofSize: size)
        return self
    }
    
    func normalFont(size : CGFloat) -> Self {
        
        self.font = .systemFont(ofSize: size)
        return self
    }
    
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

}

