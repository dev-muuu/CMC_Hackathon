//
//  ChatTitleViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import UIKit

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
