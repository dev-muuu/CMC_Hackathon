//
//  detailPostTableViewCell.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import Foundation
import SnapKit
import UIKit
import Then


class DetailPostTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    static let cellIdentifier = "DetailPostTableViewCell"

    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    final lazy var postTitle: UILabel = {
       let title = UILabel()
        title.text = "왜 난 엄마랑 소통이 안 될까?"
        title.font = UIFont.notosans(size: 28, family: .Bold)
        
        
        return title
    }()
    
    
    final lazy var postContents: UILabel = {
        let contents = UILabel()
        
        contents.text = "노싹들아 안녕. 난 엄마를 정말 사랑하는데, 왜 엄마랑 이렇게 지독히도 싸울까? 엄마는 내 말을 이해하려고 하지 않고, 자기가 틀렸다는 걸 인정하려고 하지 않아. 그냥 무조건 순종해주기만을 바라는 것 같아서 나는 그게 너무 답답해... "
        contents.font = UIFont.notosans(size: 28, family: .Regular)
        
        return contents
        
    }()
    
    final lazy var postView: UIView = {
       let postView = UIView()
        postView.backgroundColor = .white
        postView.layer.cornerRadius = 16
        postView.layer.borderWidth = 3
        
        postView.addSubview(postTitle)
        postView.addSubview(postContents)
        
        return postView
    }()
    
    // MARK: - Function
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectedBackgroundView = UIView()
        
        setUpView()
        setUpConstraint()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.contentView.addSubview(baseView)
        baseView.addSubview(postView)
    }
    
    func setUpConstraint() {
        
        baseView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        postView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
        
        postTitle.snp.makeConstraints {
            $0.top.equalTo(postView.snp.bottom).offset(10)
            $0.leading.equalTo(postView.snp.leading).offset(10)
        }
        
        postContents.snp.makeConstraints {
            $0.top.equalTo(postTitle.snp.bottom).offset(10)
            $0.leading.equalTo(postTitle)
        }
        
        
    }
    
}

