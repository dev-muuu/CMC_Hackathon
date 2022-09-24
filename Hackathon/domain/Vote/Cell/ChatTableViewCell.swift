//
//  ChatTableViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit
import Then
import SnapKit

extension UIFont{
    
    /* 프로젝트 내 적용 가능한 폰트 출력 코드
    for family in UIFont.familyNames {
        print("\(family)");
                    
        for names in UIFont.fontNames(forFamilyName: family) {
            print("== \(names)");
        }
    }
    */
    
    enum Family: String {
        case Bold, Medium, Regular
    }
    
    static func pretendard(size: CGFloat = 14, family: Family = .Medium) -> UIFont! {
        guard let font: UIFont = UIFont(name: "Pretendard-\(family)", size: size) else{
            return nil
        }
        return font
    }
}

class FightTableViewCell: UITableViewCell{
    
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
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    
    let timeLabel = UILabel().then{
        $0.text = "30분 전"
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
    }
    
    let messageLabel = UILabel().then{
        $0.text = "완전 어이없삼. 요즘"
        $0.font = UIFont.pretendard(size: 16, family: .Regular)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
            $0.top.equalToSuperview().offset(7)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nicknameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16.29)
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(5.97)
            $0.leading.equalTo(profileImage).offset(16.35)
        }
        
        messageLabel.snp.makeConstraints{
            $0.top.equalTo(timeLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        borderLine.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}

class ChatTitleViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "ChatTitleViewCell"
    
    var chatCount: Int = 0{
        didSet{
            chatCountLabel.text = "댓글 \(self.chatCountLabel)개"
        }
    }
    //MARK: - UI
    
    let chatCountLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Medium)
        $0.text = "댓글 0개"
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpView(){
//        self.baseView
    }
    
    func setUpConstraint(){
        chatCountLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(33)
            $0.bottom.equalToSuperview().offset(-19)
        }
        
        borderLine.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
