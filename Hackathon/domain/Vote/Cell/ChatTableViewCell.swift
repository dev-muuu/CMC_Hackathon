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
    static let projectBrown = UIColor(red: 220/255, green: 203/255, blue: 172/255, alpha: 1)
}

class FightTableViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "FightTableViewCell"
    
    //MARK: - UI
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var crownBtn = UIButton().then{
        $0.titleLabel?.font = UIFont.notosans(size: 15, family: .Bold)
        $0.setTitleColor(UIColor(red: 106/255, green: 106/255, blue: 106/255, alpha: 1), for: .normal)
        $0.setTitle("🏆 명예 히스토리", for: .normal)
    }
    
    let titleLabel = UILabel().then{
        $0.text = "누가 더 라떼인가"
        $0.font = UIFont.notosans(size: 28, family: .Bold)
    }
    
    lazy var topChoiceBtn = UIButton().then{
        $0.backgroundColor = .projectBrown
        $0.layer.cornerRadius = 16
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .Bold)
        $0.titleLabel?.textAlignment = .center
    }
    
    lazy var bottomChoiceBtn = UIButton().then{
        $0.backgroundColor = .projectBrown
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 16
    }
    
    let versusLabel = UILabel().then{
        $0.text = "VS"
        $0.font = UIFont.notosans(size: 67, family: .Regular)
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
        
        baseView.addSubview(crownBtn)
        baseView.addSubview(titleLabel)
        baseView.addSubview(topChoiceBtn)
        baseView.addSubview(versusLabel)
        baseView.addSubview(bottomChoiceBtn)
        
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        crownBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(33)
            $0.trailing.equalToSuperview().offset(-12)
            $0.width.equalTo(120)
            $0.height.equalTo(26)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(crownBtn).offset(34)
            $0.leading.equalToSuperview().offset(36)
        }
        
        topChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(34)
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(148)
        }
        
        versusLabel.snp.makeConstraints{
            $0.top.equalTo(topChoiceBtn.snp.bottom).offset(7)
            $0.height.equalTo(82)
            $0.centerX.equalToSuperview()
        }
        
        bottomChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(versusLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(148)
            $0.bottom.equalToSuperview()
        }
        
        
        
        
    }
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

class ChatTitleViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "ChatTitleViewCell"
    
    var chatCount: Int = 0{
        didSet{
            chatCountLabel.text = "댓글 \(self.chatCount)개"
        }
    }
    //MARK: - UI
    
    let baseView = UIView()
    
    let chatCountLabel = UILabel().then{
        $0.font = UIFont.notosans(size: 16, family: .Medium)
        $0.text = "댓글 0개"
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
        
        baseView.addSubview(chatCountLabel)
        baseView.addSubview(borderLine)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        chatCountLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(33)
            $0.bottom.equalToSuperview().offset(-19)
        }
        
        borderLine.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
