//
//  App.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation


//App유틸
// 네트워크연결상태 등 , 토큰, 푸쉬토큰 ,디바이스 토큰 등등 여기서 관리
//
class App {
    
    static let shared = App()
    
    var lastConnectionError = false
    var isReachable = true
    
}
