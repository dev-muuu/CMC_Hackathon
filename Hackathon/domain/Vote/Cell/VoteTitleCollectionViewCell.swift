//
//  VoteZtabView.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit

class VoteTitleCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "VoteTitleCollectionViewCell"
    
    let baseView = UIView()
    
    let titleLabel = UILabel().then{
        $0.text = "노란싹수배틀"
        $0.font = UIFont.notosans(size: 18, family: .Medium)
    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .black
            } else {
                titleLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
            }
        }
    }
    
    override func prepareForReuse() {
        isSelected = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.contentView.addSubview(baseView)
        
        baseView.addSubview(titleLabel)
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
