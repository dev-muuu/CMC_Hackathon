//
//  DetailPostView.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import UIKit


class DetailPostView: UIView {
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
//        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        $0.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier)
        $0.register(DetailPostTableViewCell.self, forCellReuseIdentifier: DetailPostTableViewCell.cellIdentifier)
        $0.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.cellIdentifier)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
