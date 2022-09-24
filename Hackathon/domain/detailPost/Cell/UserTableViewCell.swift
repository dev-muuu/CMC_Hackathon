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
        imageView.image = UIImage(named: "ZLogoSmall")
        imageView.layer.cornerRadius = CGFloat(27.5)
        imageView.clipsToBounds = true

        
        return imageView
    }()
    
    private lazy var nickname: UILabel = {
        let name = UILabel()
        
        name.textColor = .label
        name.font = UIFont.notosans(size: 17, family: .Bold)
        name.text = "노란싹수대장"
        
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
            $0.height.equalTo(55)
            $0.width.equalTo(55)
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nickname.snp.makeConstraints{
            $0.top.equalTo(userImage).offset(10)
            $0.leading.equalTo(userImage.snp.trailing).offset(16.29)
        }
        
    }
    
}

