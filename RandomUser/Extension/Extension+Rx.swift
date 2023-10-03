//
//  Extension+Rx.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/04.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UIRefreshControl {
    var endRefreshing: Binder<Void> {
        return Binder(self.base) { refreshControl, _ in
            refreshControl.endRefreshing()
        }
    }
}

