//
//  RandomUserViewModel.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation
import RxCocoa
import RxSwift

enum Gender : String {
    case female = "female"
    case male = "male"
}

class RandomUserViewModel : BaseViewModel, BaseViewModelType {
    struct Input {
        let didViewInit = PublishRelay<Void>()
        let refreshList = PublishRelay<Void>()
        let nextRandomUser = PublishRelay<Void>()
        let didTapGenderButton = PublishRelay<Gender>()
    }
    
    struct Output {
        let randomUserList = PublishRelay<[User]>()
        let endRefresh = PublishRelay<Void>()
                
    }
    
    var input: Input
    var output: Output
    
    private let service : RandomUserServiceType
    
    private var randomUserList : [User] = []
    
    private var gender : Gender = .male
    
    private var isRefresh = false
    
    
    
    var isPageStill = false
    
    init(input: Input = Input(), output: Output = Output() , service:  RandomUserServiceType = RandomUserService()) {
        self.input = input
        self.output = output
        self.service = service
        
        super.init()
        
        self.input.didViewInit
            .bind{[weak self] _ in
                guard let self = self else { return }
                self.fetchRandomUser(gender: self.gender.rawValue)
            }.disposed(by: self.disposeBag)
        
        self.input
            .didTapGenderButton
            .bind{[weak self] gender in
                guard let self = self else { return }
                self.gender = gender
                self.defulatFetchRandUser()
            }.disposed(by: self.disposeBag)
        
        
        self.input.refreshList
            .bind{[weak self] _ in
                guard let self = self else { return }
                self.isRefresh = true 
                self.defulatFetchRandUser()
            }.disposed(by: self.disposeBag)
        
        self.input
            .nextRandomUser
            .bind{[weak self] _ in
                guard let self = self else { return }
                self.fetchNextRandoumUser(gender: self.gender.rawValue)
            }.disposed(by: self.disposeBag)
        
    }
    
    private func defulatFetchRandUser(){
        self.page = .init(page: 1, results: 20, seed: "abc")
        self.fetchRandomUser(gender: self.gender.rawValue)
    }
    
    private func fetchRandomUser(gender : String) {
        let query = self.page
                
        service.fecthRandomUsers(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                Log.log(.api, "response -> \(response.results.count)")
                
                let list = response.results.filter {
                    $0.gender.rawValue == gender
                }
                
                self.randomUserList = self.removeDuplicates(data: list)
                self.output.randomUserList.accept(self.randomUserList)
                
                if self.isRefresh {
                    self.isRefresh = false
                    self.output.endRefresh.accept(())
                }
                
                break
            case .failure(let error):
                self.error.accept(error.localizedDescription)
            }
        }
    }
    
    private func fetchNextRandoumUser(gender : String){
        self.isPageStill = true
        let newPage = Page(page: self.page.page + 1, results: 20, seed: "abc")
        let query = newPage
        self.page = newPage
                
        service.fecthRandomUsers(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                Log.log(.api, "response1 -> \(response.results.count)")
                
                let list = response.results.filter {
                    $0.gender.rawValue == gender
                }
                                                                
                self.randomUserList = self.removeDuplicates(data: self.randomUserList + list )
                self.output.randomUserList.accept(self.randomUserList)
                
                self.isPageStill = false
                
                break
            case .failure(let error):
                self.error.accept(error.localizedDescription)
            }
        }
    }
    
    func removeDuplicates(data : [User]) -> [User] {
        var data : [User] = data
        for item in data {
            if !randomUserList.contains(where: { $0.id.value == item.id.value }) {
                data.append(item)
            }
        }
        
        return data
    }
}
