//
//  commentTableViewCell.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import SnapKit
import UIKit
import Then

final class CommentTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    static let cellIdentifier = "CommentTableViewCell"
    

    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ZLogoSmall")
        imageView.layer.cornerRadius = CGFloat(27.5)
        imageView.clipsToBounds = true

        
        return imageView
    }()
    
    
    private lazy var nickname: UILabel = {
        let name = UILabel()
        
        name.textColor = .label
        name.font = UIFont.notosans(size: 16, family: .Bold)
        name.text = "엠지천사"
        
        return name
    }()
    
    private lazy var comment: UILabel = {
        let comment = UILabel()
        
        comment.textColor = .label
        comment.font = UIFont.notosans(size: 14, family: .Regular)
        comment.text = "완전 어이없삼.요즘"
        comment.numberOfLines = 0
        
        return comment
    }()
    
    private lazy var time: UILabel = {
        let time = UILabel()
        
        time.textColor = .tertiaryLabel
        time.font = UIFont.notosans(size: 12, family: .Regular)
        time.text = "2022.09.24"
        
        return time
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
        baseView.addSubview(userImage)
        baseView.addSubview(nickname)
        baseView.addSubview(comment)
        baseView.addSubview(time)
        baseView.addSubview(borderLine)
    }
    
    func setUpConstraint() {
//        contentView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(40)
//        }
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
           
        }
        userImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(15)
            $0.height.equalTo(55)
            $0.width.equalTo(55)
            $0.bottom.equalToSuperview().offset(-25)
        }
        
        nickname.snp.makeConstraints {
            $0.top.equalTo(userImage)
            $0.leading.equalTo(userImage.snp.trailing).offset(20)
        }
        
        comment.snp.makeConstraints {
            $0.top.equalTo(nickname.snp.bottom).offset(5)
            $0.leading.equalTo(nickname)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        time.snp.makeConstraints {
            $0.top.equalTo(comment.snp.bottom).offset(-15)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        borderLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
}
