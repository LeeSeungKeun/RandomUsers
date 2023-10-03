//
//  RandomUserViewController.swift
//  MrPick
//
//  Created by 이성근 on 2023/09/25.
//

import UIKit
import RxSwift

class RandomUserViewController: BaseViewController , BaseViewControllerType {
    typealias ViewModel = RandomUserViewModel
    
    var viewModel : ViewModel!
    
    var mainView = RandomUserView()
    
    var factory : RandomViewFactoryType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ViewModel! , factory : RandomViewFactoryType) {
        self.factory = factory
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    func initialize() {
        self.view = mainView
        self.title = "리스트"
        
    }
    func bind() {
        self.viewModel
            .output
            .randomUserList
            .asDriver(onErrorJustReturn: [])
            .drive(self.mainView.randomUserTableView.rx.items(cellIdentifier: RandomUserCell.id
                                                              ,cellType: RandomUserCell.self)){ row , item , cell in
                cell.updateUI(data: item)
                
                cell.selectButton
                    .rx
                    .tap
                    .asDriver(onErrorJustReturn: ())
                    .drive(onNext:{[weak self] _ in
                        guard let self = self else { return }
                        let vc = self.factory.createUserDetailVC(data: item)
                        self.pushVC(vc)
                    }).disposed(by: cell.disposeBag)
                
            }.disposed(by: self.disposeBag)
        
        let femelAction = mainView.femaleButton.rx.tap.map { Gender.female }
        let maleAction = mainView.maleButton.rx.tap.map { Gender.male }
        
        Observable.merge(femelAction, maleAction)
            .bind(to: self.viewModel.input.didTapGenderButton)
            .disposed(by: self.disposeBag)
        
        self.mainView
            .refreshControl
            .rx
            .controlEvent(.valueChanged)
            .bind(to: self.viewModel.input.refreshList)
            .disposed(by: self.disposeBag)
        
        self.viewModel
            .output
            .endRefresh
            .asDriver(onErrorJustReturn: ())
            .drive(self.mainView.refreshControl.rx.endRefreshing)
            .disposed(by: self.disposeBag)
        
        self.viewModel
            .output
            .endRefresh
            .asDriver(onErrorJustReturn: ())
            .drive(onNext:{[weak self] _ in
                guard let self = self else { return }
                self.mainView.refreshControl.endRefreshing()
            }).disposed(by: self.disposeBag)
        
        
        self.mainView
            .randomUserTableView
            .rx
            .didScroll
            .bind{[weak self] _ in
                guard let self = self else { return }
                guard !self.viewModel.isPageStill else {return}
                
                let tv = self.mainView.randomUserTableView
                let scrollY = tv.contentOffset.y
                let contentHeight = tv.contentSize.height
                
                guard scrollY + 100 >= (contentHeight - tv.frame.size.height) else { return }
                
                self.viewModel.input.nextRandomUser.accept(())
                
                print("random")
                
            }.disposed(by: self.disposeBag)
            
        
        self.viewModel.input.didViewInit.accept(())
    }
}
