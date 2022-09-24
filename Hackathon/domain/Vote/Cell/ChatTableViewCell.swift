//
//  ChatTableViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit
import Then
import SnapKit


extension UIColor{
    static let lightBrown = UIColor(red: 241/255, green: 233/255, blue: 217/255, alpha: 1)
    static let deepBrown = UIColor(red: 220/255, green: 203/255, blue: 172/255, alpha: 1)
}

class ChatTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ChatTableViewCell"
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let profileImage = UIImageView().then{
        $0.backgroundColor = UIColor(red: 226/255, green: 215/255, blue: 236/255, alpha: 1)
    }
    
    let nicknameLabel = UILabel().then{
        $0.text = "노란싹수대장"
        $0.font = UIFont.notosans(size: 14, family: .Bold)
    }
    
    let timeLabel = UILabel().then{
        $0.text = "30분 전"
        $0.font = UIFont.notosans(size: 14, family: .Regular)
    }
    
    let messageLabel = UILabel().then{
        $0.text = "완전 어이없삼. 요즘"
        $0.font = UIFont.notosans(size: 16, family: .Regular)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }


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
        
        self.baseView.addSubview(profileImage)
        self.baseView.addSubview(nicknameLabel)
        self.baseView.addSubview(timeLabel)
        self.baseView.addSubview(messageLabel)
        self.baseView.addSubview(borderLine)
        
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        profileImage.snp.makeConstraints{
            $0.width.equalTo(47.71)
            $0.height.equalTo(45.58)
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nicknameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16.29)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5.97)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16.35)
        }
        
        messageLabel.snp.makeConstraints{
            $0.top.equalTo(timeLabel.snp.bottom).offset(12)
            $0.leading.equalTo(nicknameLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        borderLine.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}
