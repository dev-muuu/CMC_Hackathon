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
        title.font = UIFont.notosans(size: 23, family: .Bold)
        
        
        return title
    }()
    
    
    final lazy var postContents: UILabel = {
        let contents = UILabel()
        
        contents.textColor = .darkGray
        contents.text = "노싹들아 안녕. 난 엄마를 정말 사랑하는데, 왜 엄마랑 이렇게 지독히도 싸울까? 엄마는 내 말을 이해하려고 하지 않고, 자기가 틀렸다는 걸 인정하려고 하지 않아. 그냥 무조건 순종해주기만을 바라는 것 같아서 나는 그게 너무 답답해... "
        let attrString = NSMutableAttributedString(string: contents.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        contents.attributedText = attrString
        
        contents.numberOfLines = 0
        contents.font = UIFont.notosans(size: 30, family: .Regular)
        
        return contents
        
    }()
    
    final lazy var postView: UIView = {
       let postView = UIView()
        postView.backgroundColor = .white
        postView.layer.cornerRadius = 16
//        postView.layer.borderWidth = 3
        
        postView.addSubview(postTitle)
        postView.addSubview(postContents)
        
        return postView
    }()
    
    final lazy var sadBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .darkGray
        btn.setTitle("38", for: .normal)
        btn.layer.cornerRadius = 5
        
        return btn
    }()
    
    let borderLine = UIView().then{
        $0.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }
    
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
        baseView.addSubview(sadBtn)
        baseView.addSubview(borderLine)

    }
    
    func setUpConstraint() {
        
        baseView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        postView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview().offset(-19)
        }
        
        postTitle.snp.makeConstraints {
            $0.top.equalTo(postView).offset(25)
            $0.leading.equalTo(postView.snp.leading).offset(10)
        }
        
        postContents.snp.makeConstraints {
            $0.top.equalTo(postTitle.snp.bottom).offset(20)
            $0.leading.equalTo(postTitle)
            $0.trailing.equalTo(postView)
        }

        sadBtn.snp.makeConstraints {
            $0.top.equalTo(postView.snp.bottom).inset(50)
            $0.leading.equalTo(postView.snp.trailing).offset(-30)
            
        }
        borderLine.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
}

