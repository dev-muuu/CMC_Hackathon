//
//  VoteView.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

class VoteView: UIView {
    
    let titleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        
        $0.collectionViewLayout = flowLayout
        
        $0.register(VoteTitleCollectionViewCell.self, forCellWithReuseIdentifier: VoteTitleCollectionViewCell.cellIdentifier)
    }
    
    let tabLineView = UIView().then{
        $0.backgroundColor = .black
    }
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        $0.register(FightTableViewCell.self, forCellReuseIdentifier: FightTableViewCell.cellIdentifier)
        $0.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.cellIdentifier)
    }
    
    let chatView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let chatTextfield = UITextField().then{
        $0.placeholder = "댓글을 입력해주세요"
        $0.layer.cornerRadius = 40/2
        $0.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        $0.font = UIFont.notosans(size: 16, family: .Regular)
        $0.addLeftPadding()
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(titleCollectionView)
        self.addSubview(tabLineView)
        self.addSubview(tableView)
        
        self.addSubview(chatView)
        chatView.addSubview(chatTextfield)
        
        titleCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(65)
        }
        
        tabLineView.snp.makeConstraints{
            $0.height.equalTo(3)
            $0.top.equalTo(titleCollectionView.snp.bottom)
            let size = (Const.DEVICE_WIDTH - 66) / 2
            $0.width.equalTo(size)
        }
        
        tableView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(tabLineView.snp.bottom)
        }
        
        chatView.snp.makeConstraints{
            $0.height.equalTo(90)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        chatTextfield.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(33)
            $0.trailing.equalToSuperview().offset(-32)
            $0.bottom.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
