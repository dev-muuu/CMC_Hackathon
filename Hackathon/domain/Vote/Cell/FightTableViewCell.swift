//
//  FightTableViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import UIKit

class FightTableViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "FightTableViewCell"
    
    //MARK: - UI
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let titleLabel = UILabel().then{
        $0.text = "누가 더 라떼인가"
        $0.font = UIFont.notosans(size: 28, family: .Bold)
    }
    
    lazy var topChoiceBtn = UIButton().then{
        $0.backgroundColor = .lightBrown
        $0.layer.cornerRadius = 16
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.numberOfLines = 0
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.setTitle("편의점 알바생에게 반말하는 우리 엄마", for: .normal)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    lazy var bottomChoiceBtn = UIButton().then{
        $0.backgroundColor = .deepBrown
        $0.layer.cornerRadius = 16
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.numberOfLines = 0
        $0.titleLabel?.font = UIFont.notosans(size: 20, family: .Bold)
        $0.titleLabel?.textAlignment = .center
        $0.setTitle("편의점 알바생에게 반말하는 우리 엄마", for: .normal)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    let versusLabel = UILabel().then{
        $0.text = "VS"
        $0.textAlignment = .center
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
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(topChoiceBtn)
        baseView.addSubview(versusLabel)
        baseView.addSubview(bottomChoiceBtn)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.leading.equalToSuperview().offset(36)
        }
        
        topChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(34)
            $0.leading.equalToSuperview().offset(34)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(148)
        }
        
        versusLabel.snp.makeConstraints{
            $0.top.equalTo(topChoiceBtn.snp.bottom).offset(7)
            $0.height.equalTo(82)
            $0.centerX.equalToSuperview()
        }
        
        bottomChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(versusLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(34)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(148)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    class PercentageView: UIView{
        
        let highPercentageView = UIView()
        let lowPercentageView = UIView()
        
        override init(frame: CGRect) {
            
            super.init(frame: .zero)
            
            self.layer.cornerRadius = 16
            
            self.addSubview(highPercentageView)
            self.addSubview(lowPercentageView)
            
            self.snp.makeConstraints{
                $0.height.equalTo(66.43)
                
            }
            
            highPercentageView.snp.makeConstraints{
                $0.top.bottom.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}
