//
//  BaseViewControllerType.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import UIKit

protocol BaseViewControllerType {
    associatedtype ViewModel
    func initialize()
    func bind()
}
