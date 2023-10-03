//
//  RandomUserDetailView.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/04.
//

import Foundation
import UIKit


class RandomUserDetailView : BaseView , BaseViewType {
    
    var pictureImageView = UIImageView()
    var nameLabel = UILabel().text("Hi, my name ").normalFont(size: 12).numberOfLines(0).alignment(.center)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(data : User) {
        if let url = URL(string: data.picture.large) { //128 x 128
            pictureImageView.kf.setImage(with: url)
        }
        let name = data.name.title + data.name.first + data.name.last
        let attributeString = NSMutableAttributedString().normal("Hi, my name\n", fontSize: 15 , color: .setCustomColor(.defaultGray)).bold(name, fontSize: 17)
        
        nameLabel.attributedText = attributeString
    }
    
    func setUI() {
        self.addSubview(pictureImageView)
        self.addSubview(nameLabel)
    }
    
    func setLayout() {
        self.pictureImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(128)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(pictureImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
