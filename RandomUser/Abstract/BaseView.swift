//
//  BaseView.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/23.
//

import Foundation
import UIKit
import SnapKit
import Then


class BaseView : UIView {
    deinit {
        print("<<<<<< END \(Self.self) >>>>>>")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        self.backgroundColor = .setCustomColor(.defaultWhite)
        

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
