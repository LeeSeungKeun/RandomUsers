//
//  RandomUserService.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import Alamofire

enum MyError : String, Error {
    case serverError = "서버에러"
    case InvalidURL = "존재하지 않는 URL"
    
}

protocol RandomUserServiceType {
    func fecthRandomUsers(query : Page , compleation : @escaping (Result<RandomUserResponse , MyError>) ->())
}

//Repo
class RandomUserService : RandomUserServiceType{
    func fecthRandomUsers(query : Page, compleation : @escaping (Result<RandomUserResponse , MyError>) ->()) {
        
        APIManager.session.request(RandomUserTarget.get_random_user(query))
            .responseDecodable { (response : AFDataResponse<RandomUserResponse>) in
                switch response.result {
                case .success(let response):
                    compleation(.success(response))
                case .failure(let error):
                    if error.isInvalidURLError {
                        compleation(.failure(MyError.InvalidURL))
                        print(error.localizedDescription)
                    }
                    
                    if error.isResponseValidationError {
                        compleation(.failure(MyError.serverError))
                        print(error.localizedDescription)
                    }
                    
                    compleation(.failure(MyError.serverError))
                    print("Alamofire Error \(error.localizedDescription)")
                }
            }
    }
}


