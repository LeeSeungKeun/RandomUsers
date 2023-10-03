//
//  RandomUserCell.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/23.
//

import Foundation
import UIKit
import Kingfisher
import RxSwift

class RandomUserCell : BaseTableViewCell {
    let labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 4
    }
    var genderLabel = KeyValueLabel(title: "성별", content: "남")
    var nameLabel = KeyValueLabel(title: "이름", content: "홍길동")
    var birthDayLabel = KeyValueLabel(title: "생일", content: "1993")
    var emailLabel = KeyValueLabel(title: "이메일", content: "myAddress")
    var pictureImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    var selectButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    var disposeBag = DisposeBag()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
        self.genderLabel.contentLabel.text = ""
        self.nameLabel.contentLabel.text = ""
        self.emailLabel.contentLabel.text = ""
        self.birthDayLabel.contentLabel.text = ""
    }
    
    func setUI(){
        [labelStackView, pictureImageView , selectButton].forEach {
            self.contentView.addSubview($0)
        }
//        self.contentView.addSubview(labelStackView)
//        self.contentView.addSubview(pictureImageView)
//        self.contentView.addSubview(selectButton)
        
        
        [genderLabel, nameLabel, birthDayLabel , emailLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
    }
    
    func setLayout(){
        pictureImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().inset(20)
            make.width.height.equalTo(72)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(pictureImageView)
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        
        selectButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateUI(data : User){
        if let url = URL(string: data.picture.medium) {
            self.pictureImageView.kf.setImage(with: url)
        }
        
        if let dateString = data.dob.date.dateToString() {
            self.birthDayLabel.contentLabel.text = dateString
        }
        
        let gender = data.gender.rawValue == "female" ? "여자" : "남자"
        nameLabel.contentLabel.text = data.name.title + data.name.first + data.name.last
        emailLabel.contentLabel.text = data.email
        genderLabel.contentLabel.text = gender
    }
}
