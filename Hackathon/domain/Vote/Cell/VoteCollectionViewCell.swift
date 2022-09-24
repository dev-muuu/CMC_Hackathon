//
//  VoteXtabView.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit

class VoteCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "VoteTitleCollectionViewCell"

    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        $0.register(FightTableViewCell.self, forCellReuseIdentifier: FightTableViewCell.cellIdentifier)
        $0.register(ChatTitleViewCell.self, forCellReuseIdentifier: ChatTitleViewCell.cellIdentifier)
        $0.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.cellIdentifier)
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
