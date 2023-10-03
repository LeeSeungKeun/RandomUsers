//
//  ButtonType.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol CustomButtonType {
    func setTitleColor(normal : ColorCode , disabled : ColorCode)
    func setBackgroundColor(normal : ColorCode , disabled : ColorCode)
    //특정기능 추가 시 여기에 추가    
}


extension CustomButtonType where Self : UIButton {
    
    func setTitleColor(normal : ColorCode , disabled : ColorCode) {
        self.setTitleColor(.setCustomColor(normal), for: .normal)
        self.setTitleColor(.setCustomColor(disabled), for: .disabled)
    }
    
    func setBackgroundColor(normal : ColorCode , disabled : ColorCode) {
        self.backgroundColor = .setCustomColor(normal)
        self.setBackgroundImage(UIImage(color: .setCustomColor(normal)), for: .disabled)
    }
    
}
