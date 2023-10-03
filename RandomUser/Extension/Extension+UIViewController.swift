//
//  Extension+UIViewController.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation
import UIKit


extension UIViewController {
    func pushVC(_ vc: UIViewController, animated: Bool = true, title: String? = nil) {
        vc.title = "\(title ?? "")"
        
        self.navigationController?.pushViewController(vc, animated: animated)
    }
}
