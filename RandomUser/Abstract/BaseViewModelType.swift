//
//  BaseViewModelType.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation

protocol BaseViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
