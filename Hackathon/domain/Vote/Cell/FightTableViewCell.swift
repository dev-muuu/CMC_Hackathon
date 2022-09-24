//
//  FightTableViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import UIKit

class Const{
    static let DEVICE_WIDTH = UIScreen.main.bounds.size.width
    static let DEVICE_HEIGTH = UIScreen.main.bounds.size.height
}

class FightTableViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "FightTableViewCell"
    
    var superViewController: VoteViewController!
    
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
        
        $0.addTarget(self, action: #selector(choiceBtnDidClicked), for: .touchUpInside)
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
        
        $0.addTarget(self, action: #selector(choiceBtnDidClicked), for: .touchUpInside)
    }
    
    let versusFrame = UIView()
    
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
        
        self.selectedBackgroundView = UIView()
        self.contentView.addSubview(baseView)
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(topChoiceBtn)
        baseView.addSubview(versusFrame)
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
            $0.bottom.equalTo(topChoiceBtn.snp.top).offset(-34)
        }
        
        topChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(34)
            $0.leading.equalToSuperview().offset(34)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(148)
        }
        
        versusFrame.snp.makeConstraints{
            $0.top.equalTo(topChoiceBtn.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomChoiceBtn.snp.top)
        }
        
        bottomChoiceBtn.snp.makeConstraints{
            $0.top.equalTo(versusFrame.snp.bottom)
            $0.leading.equalToSuperview().offset(34)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(148)
            $0.bottom.equalToSuperview()
        }
    }
    
    func willShowVersusView(){
        
        versusFrame.addSubview(versusLabel)
        
        versusLabel.snp.makeConstraints{
            $0.top.equalTo(topChoiceBtn.snp.bottom).offset(7)
            $0.height.equalTo(82)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-17)
        }
    }
    
    func willShowPercentageView(){
        
        //TODO: - MyPick label 추가
        versusLabel.removeFromSuperview()
    
        let percentageView = PercentageView(high: 88, low: 12)
        versusFrame.addSubview(percentageView)
        
        percentageView.snp.makeConstraints{
            $0.height.equalTo(66.43)
            $0.top.equalToSuperview().offset(49.33)
            $0.bottom.equalToSuperview().offset(-55.57)
            $0.leading.equalToSuperview().offset(31.37)
            $0.trailing.equalToSuperview().offset(-30.81)
        }
    
    }
    
    @objc func choiceBtnDidClicked(){
        superViewController!.didVote = true
    }
}

extension FightTableViewCell{
    
    class PercentageView: UIView{
        
        var highPercentage: CGFloat!
        var lowPercentage: CGFloat!
        
        let highPercentageView = UILabel().then{
            $0.backgroundColor = .deepBrown
            $0.layer.cornerRadius  = 16
            $0.clipsToBounds = true
            $0.textAlignment = .center
            $0.font = UIFont.notosans(size: 30, family: .Bold)
        }
        
        let lowPercentageLabel = UILabel().then{
            $0.textAlignment = .center
            $0.font = UIFont.notosans(size: 30, family: .Bold)
        }
        
        let lowPercentageView = UIView().then{
            $0.backgroundColor = .lightBrown
            $0.layer.cornerRadius  = 16
            $0.clipsToBounds = true
        }
        
        init(high: CGFloat, low: CGFloat){
            
            super.init(frame: .zero)
            
            self.highPercentage = high
            
            highPercentageView.text = "\(Int(high))%"
            lowPercentageLabel.text = "\(Int(low))%"
    
            self.layer.cornerRadius = 16
            
            self.addSubview(lowPercentageView)
            self.addSubview(highPercentageView)
            lowPercentageView.addSubview(lowPercentageLabel)
            
            highPercentageView.snp.makeConstraints{
                $0.top.leading.bottom.equalToSuperview()
            }
            
            lowPercentageView.snp.makeConstraints{
                $0.top.trailing.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
//                $0.leading.equalToSuperview()
            }
            
            lowPercentageLabel.snp.makeConstraints{
                $0.top.bottom.equalToSuperview()
                $0.leading.equalTo(highPercentageView.snp.trailing)
                $0.trailing.equalToSuperview()
            }
            
            setPercentageWidth()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setPercentageWidth(){
            
            let highWidth = (Const.DEVICE_WIDTH - 68) * self.highPercentage / 100
            
            
            highPercentageView.snp.makeConstraints{
                $0.width.equalTo(highWidth)
            }
            
        }
    }
}
