//
//  RandomUserDetailViewController.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/04.
//

import UIKit

class RandomUserDetailViewController: BaseViewController {
    
    let mainView = RandomUserDetailView()
    let user : User
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        view = self.mainView
        self.mainView.updateUI(data: user)
    }
    
    init(user : User) {
        self.user = user
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
