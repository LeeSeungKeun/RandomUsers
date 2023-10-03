//
//  RandomUserTarget.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation

import Foundation
import Alamofire

enum RandomUserTarget {
    case get_random_user(Page)
}

extension RandomUserTarget : BaseTargetType {
    var baseURL: String {
        return BaseLink.API.baseUrl
    }
    
    var method: HTTPMethod {
        switch self {
        case .get_random_user :
            return .get
        }
    }
     
    var path: String {
        switch self {
        case .get_random_user :
            return "/api/"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .get_random_user(let query):
            return .query(query)
        }
    }
}
 
