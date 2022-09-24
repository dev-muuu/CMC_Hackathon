//
//  commentTableViewCell.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import Foundation
import SnapKit
import UIKit
import Then

final class commentTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage()
        imageView.layer.cornerRadius = CGFloat(25)
        imageView.clipsToBounds = true

        
        return imageView
    }()
    
    
    private lazy var nickname: UILabel = {
        let name = UILabel()
        
        name.textColor = .label
        name.font = .systemFont(ofSize: 20.0, weight: .light)
        name.text = "사용자명"
        
        return name
    }()
    
    private lazy var comment: UILabel = {
        let comment = UILabel()
        
        comment.textColor = .label
        comment.font = .systemFont(ofSize: 20.0, weight: .light)
        comment.text = "완전 어이없삼.요즘"
        
        return comment
    }()
    
    private lazy var time: UILabel = {
        let time = UILabel()
        
        time.textColor = .tertiaryLabel
        time.font = .systemFont(ofSize: 20.0, weight: .light)
        time.text = "30분 전"
        
        return time
    }()
    
    // MARK: - Function
    
    func setup() {
        [
            userImage,
            nickname,
            comment,
            time
        ].forEach{addSubview($0)}
        
        userImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(75)
            $0.bottom.equalToSuperview().inset(3)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        nickname.snp.makeConstraints {
            $0.top.equalTo(userImage)
            $0.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        
        comment.snp.makeConstraints {
            $0.top.equalTo(nickname.snp.bottom).offset(10)
            $0.leading.equalTo(nickname)
        }
        
        
    }
    
}
