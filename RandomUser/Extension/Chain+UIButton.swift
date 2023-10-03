//
//  Chain+UIButton.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit

extension UIButton {
    
    @discardableResult
    func title(_ title: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        self.titleLabel?.font = .systemFont(ofSize: fontSize)
        return self
    }
    
    func boldFont(size : CGFloat) -> Self {
        self.titleLabel?.font = .boldSystemFont(ofSize: size)
        return self
    }
    
    func normalFont(size : CGFloat) -> Self {        
        self.titleLabel?.font = .systemFont(ofSize: size)
        return self
    }
}




