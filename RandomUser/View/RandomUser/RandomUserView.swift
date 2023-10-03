//
//  ProfileListView.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/23.
//

import Foundation
import UIKit


class RandomUserView : BaseView , BaseViewType {
    
    let titleLabel = UILabel().text("유저목록").boldFont(size: 20)
    
    let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    let refreshControl = UIRefreshControl()

    
    var femaleButton = NormalButton().title("여자").normalFont(size: 14)
    
    var maleButton = NormalButton().title("남자").normalFont(size: 14)
    
    var randomUserTableView = UITableView().then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        
        $0.register(RandomUserCell.self, forCellReuseIdentifier: RandomUserCell.id)
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    func setLayout(){
        let views = [buttonStackView, randomUserTableView, titleLabel ]
        views.forEach {
            self.addSubview($0)
        }
        
        self.randomUserTableView.refreshControl = self.refreshControl
        
        self.buttonStackView.addArrangedSubview(maleButton)
        self.buttonStackView.addArrangedSubview(femaleButton)
    }
    
    func setUI(){
        let width = (UIScreen.main.bounds.width / 2) - 40 - 8
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(48)
        }
        
        self.randomUserTableView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(10)
            make.left.right.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

