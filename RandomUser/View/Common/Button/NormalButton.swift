//
//  NormalButton.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit
import SnapKit

class NormalButton : UIButton , CustomButtonType {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(normal: .defaultWhite, disabled: .defaultWhite)
        setBackgroundColor(normal: .defaultBlack, disabled: .defaultGray)
        
        self.titleLabel?.font = .systemFont(ofSize: 14)
        self.cornerRadius = 8 
        self.layer.masksToBounds = true
        
        
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
        }

    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
