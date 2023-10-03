//
//  UserViewFactory.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation

class RandomViewFactory : RandomViewFactoryType {
    func createProfileListVC(viewModel : RandomUserViewModel) -> BaseNavigation {
        let vc = BaseNavigation(rootViewController: RandomUserViewController(viewModel: viewModel, factory: self))
        return vc
    }
    
    func createUserDetailVC(data: User) -> RandomUserDetailViewController {
        return RandomUserDetailViewController(user: data)
    }
}
