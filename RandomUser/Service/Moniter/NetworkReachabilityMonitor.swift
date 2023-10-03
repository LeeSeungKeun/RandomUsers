//
//  Environment.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit
import Alamofire

class NetworkReachabilityMonitor {
    static let shared = NetworkReachabilityMonitor()
    
    private var reachability: NetworkReachabilityManager?
     
    private let netErrorAlert: UIAlertController = {
      UIAlertController(title: "인터넷 연결 끊김", message: "인터넷 연결을 확인해주세요.", preferredStyle: .alert)
    }()
    
    private init() {
        monitorReachability()
    }
    //셀룰러/와이파이(네트워크 상태) 확인
    private func monitorReachability() {
        if reachability == nil {
            reachability = NetworkReachabilityManager(host: "www.apple.com")
        }
    }
    
    func startNetworkMointer() {
        reachability?.startListening { status in
            switch status {
            case .notReachable:
                self.showNetError()
            case .reachable(let type):
                switch type {
                case .cellular:
                    print("🏖🏖🏖 셀룰러 접근")
                case .ethernetOrWiFi:
                    print("🚦🚦🚦 와이파이 접근")
                }
                self.conn()
            default:
                print("연결")
            }
        }
    }
    
    private func showAlert() {
      let rootViewController = UIApplication.shared.windows.first?.rootViewController
      rootViewController?.present(netErrorAlert, animated: true, completion: nil)
    }

    private func dismissAlert() {
      let rootViewController = UIApplication.shared.windows.first?.rootViewController
        netErrorAlert.dismiss(animated: true, completion: nil)
    }
     
    private func showNetError() {
        print("🏝🏝🏝 네트워크 연결 필요")
        showAlert()
    }
     
    private func conn() {
        print("⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️")
        dismissAlert()
    }
}


enum BaseLink {
    case API // API요청시 공통 BaseURL
    case webView // 웹뷰 사용 메인 페이지 사용 시
    case link //  외부링크
    
    var baseUrl: String {
        switch self {
        case .API :
            #if DEBUG
            let api = "https://randomuser.me/"
            #else
            let api = "https://randomuser.me/"
            #endif
            return api
        case .webView :
            #if DEBUG
            let link = "https://randomuser.me/"
            #else
            let link = "https://randomuser.me/"
            #endif
            return link
        case .link     :
            #if DEBUG
            let link = "https://randomuser.me/"
            #else
            let link = "https://randomuser.me/"
            #endif
            return link
        }
    }
}
