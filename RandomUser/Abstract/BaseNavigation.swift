//
//  BaseNavigation.swift
//  RandomUser
//
//  Created by 이성근 on 2023/09/25.
//

import Foundation
import UIKit

class BaseNavigation : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    //커스텀 네비게이션이 필요할경우 여기서
    func setNavigation(){
        print("BaseNavigatino Init")
    }
}
