//
//  UserTableViewCell.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import Foundation
import SnapKit
import UIKit
import Then


final class UserTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    static let cellIdentifier = "UserTableViewCell"
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
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
    
    func setUpView(){
        self.contentView.addSubview(baseView)
        
        baseView.addSubview(userImage)
        baseView.addSubview(nickname)
    }
    
    func setUpConstraint() {
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        userImage.snp.makeConstraints{
            $0.width.equalTo(47.71)
            $0.height.equalTo(45.58)
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nickname.snp.makeConstraints{
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalTo(userImage.snp.trailing).offset(16.29)
        }
        
    }
    
}

