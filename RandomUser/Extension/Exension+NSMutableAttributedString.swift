//
//  Exension+NSMutableAttributedString.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/04.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    func normal(_ text: String, fontSize: CGFloat, color: UIColor = .setCustomColor(.defaultBlack)) -> NSMutableAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]

        self.append(NSMutableAttributedString(string: text, attributes: attrs))

        return self
    }
    
    func bold(_ text: String, fontSize: CGFloat, color: UIColor = .setCustomColor(.defaultBlack)) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: color]

        self.append(NSMutableAttributedString(string: text, attributes: attrs))

        return self
    }
}
