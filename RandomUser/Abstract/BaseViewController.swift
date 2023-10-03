//
//  BaseViewController.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import UIKit
import RxSwift
import RxCocoa

typealias CallBack = () -> Void

class BaseViewController: UIViewController {
    deinit {
        print("<<<<<< END \(Self.self) >>>>>>")
    }
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(title : String? = nil ,
                   message : String? = nil ,
                   style : UIAlertController.Style = .alert ,
                   confrimTitle : String? = nil ,
                   cancelTitle : String? = nil ,
                   confrimAction : CallBack? = nil ,
                   cancelAction : CallBack? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let confrimAction = UIAlertAction(title: confrimTitle, style: .default) { _ in
            if let callback = confrimAction {
                callback()
            }
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            if let callback = cancelAction {
                callback()
            }
        }
        alert.addAction(confrimAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
}
