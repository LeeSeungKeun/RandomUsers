//
//  KeyValueLabel.swift
//  MrPick
//
//  Created by 이성근 on 2023/10/03.
//

import Foundation
import UIKit

class KeyValueLabel : UIView {
    let titleLabel = UILabel().text("제목").normalFont(size: 12).textColor(.defaultGray)
    let contentLabel = UILabel().text("내용").normalFont(size: 14).textColor(.defaultBlack).numberOfLines(0)
    
    init(title: String , content: String) {
        self.titleLabel.text = title
        self.contentLabel.text = content
        
        super.init(frame: .zero)
        
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
    }
    
    func setUI() {
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(40)
        }
        
        self.contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.left.equalTo(titleLabel.snp.right).offset(21)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
}
