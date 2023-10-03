//
//  Log.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation

class Log {
    enum LogType: String{
        case error
        case success
        case action
        case canceled
        case normal
        case api
    }
    
    static func log(_ logType:LogType,_ message:String){
        switch logType {
        case LogType.api:
            print("\n📘 API: \(message)\n")
        case LogType.error:
            print("\n📕 Error : \(message)\n")
        case LogType.success:
            print("\n📗 Success : \(message)\n")
        case LogType.action:
            print("\n📘 Action : \(message)\n")
        case LogType.canceled:
            print("\n📓 [canceled]: \(message)\n")
        case LogType.normal:
            print("\n📓 [normal] : \(message)\n")
        }
    }
}
