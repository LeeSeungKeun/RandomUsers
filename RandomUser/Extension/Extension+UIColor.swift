//
//  Extension+UIColor.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/23.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }
    
    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    

    
    //커스텀코드
    class func setCustomColor(_ code: ColorCode) -> UIColor {
        guard let color = UIColor(named: code.rawValue) else {
            fatalError("Not found color: \(code.rawValue)")
            return UIColor.black
        }
        return color
    }
}


enum ColorCode: String {
    case defaultWhite           = "#FFFFFF"
    case defaultBlack           = "#000000"
    case defaultRed             = "#FF0000"
    case defaultBlue            = "#0000FF"
    case defaultGray            = "#C3CAD0"
}


