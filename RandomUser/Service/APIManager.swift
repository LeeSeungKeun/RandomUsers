//
//  APIManager.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import Alamofire

class APIManager {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
}
