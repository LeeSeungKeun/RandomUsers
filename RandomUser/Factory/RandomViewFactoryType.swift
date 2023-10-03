//
//  RandomViewFactoryType.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation

protocol RandomViewFactoryType {
    func createProfileListVC(viewModel : RandomUserViewModel) -> BaseNavigation
    func createUserDetailVC(data : User) -> RandomUserDetailViewController
}
