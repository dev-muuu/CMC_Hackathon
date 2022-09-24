//
//  VoteView.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit


class VoteView: UIView {
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        $0.register(FightTableViewCell.self, forCellReuseIdentifier: FightTableViewCell.cellIdentifier)
        $0.register(ChatTitleViewCell.self, forCellReuseIdentifier: ChatTitleViewCell.cellIdentifier)
        $0.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.cellIdentifier)
    }
    
    let chatView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let chatTextfield = UITextField().then{
        $0.placeholder = "댓글을 입력해주세요"
        $0.layer.cornerRadius = 40/2
        $0.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        $0.font = UIFont.notosans(size: 16, family: .Regular)
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(tableView)
        self.addSubview(chatView)
        chatView.addSubview(chatTextfield)
        
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
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
