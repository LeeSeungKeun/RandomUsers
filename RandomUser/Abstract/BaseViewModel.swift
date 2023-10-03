//
//  BaseViewModel.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    var disposeBag = DisposeBag()
    var error = PublishRelay<String>()
    var page : Page = .init(page: 1, results: 20, seed: "abc")
    
    
    deinit {
        print("<<<<<< END \(Self.self) >>>>>>")
    }
}
