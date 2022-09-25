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
    
    static let accessToken = "VdcqhPDSLt7NbX7I_DxCJaAWcWE-cs7H9MdiYUe0Cj11GgAAAYNx6fTX"
    
    static let userId = 7
}

extension UIColor{
    
    static let lightYellow = UIColor(red: 252/255, green: 239/255, blue: 165/255, alpha: 1)
    static let deepYellow = UIColor(red: 254/255, green: 250/255, blue: 229/255, alpha: 1)
    
    static let lightBrown = UIColor(red: 241/255, green: 233/255, blue: 217/255, alpha: 1)
    static let deepBrown = UIColor(red: 220/255, green: 203/255, blue: 172/255, alpha: 1)
}

class FightTableViewCell: UITableViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "FightTableViewCell"
    
    var superViewController: VoteViewController!
    
    var voteData: UserVoteResult! {
        didSet{
            self.topChoiceBtn.setTitle(voteData.topic1, for: .normal)
            self.topChoiceBtn.setTitle(voteData.topic2, for: .normal)
        }
    }
    
    var type: FightType!{
        didSet{
            print("type setting?")
            print(type)
            self.topChoiceBtn.backgroundColor = type.lightColor
            self.bottomChoiceBtn.backgroundColor = type.deepColor
        }
    }
    
    var didVote = false{
        didSet{
            superViewController.mainView.tableView.reloadData()
        }
    }
    
    var chatCount: Int = 0{
        didSet{
            chatCountLabel.text = "댓글 \(self.chatCount)개"
        }
    }
    
    //MARK: - UI
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    let titleLabel = UILabel().then{
        $0.text = "누가 더 라떼인가"
        $0.font = UIFont.notosans(size: 28, family: .Bold)
    }
    
    let choiceTag = UILabel().then{
        $0.text = "My Pick"
        $0.font = UIFont.notosans(size: 15, family: .Bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 32/2
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1).cgColor
    }
    
    lazy var topChoiceBtn = UIButton().then{
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
    
    let chatCountLabel = UILabel().then{
        $0.font = UIFont.notosans(size: 16, family: .Medium)
        $0.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
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
        
        self.selectedBackgroundView = UIView()
        self.contentView.addSubview(baseView)
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(topChoiceBtn)
        baseView.addSubview(versusFrame)
        baseView.addSubview(versusLabel)
        baseView.addSubview(bottomChoiceBtn)
        baseView.addSubview(chatCountLabel)
        baseView.addSubview(borderLine)
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
        }
        
        chatCountLabel.snp.makeConstraints{
            $0.top.equalTo(bottomChoiceBtn.snp.bottom).offset(36)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-18)
        }
        
        borderLine.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.leading.trailing.bottom.equalToSuperview()
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
    
        let percentageView = PercentageView(type: self.type, top: CGFloat(self.voteData.percent1), bottom: CGFloat(self.voteData.percent2))
        versusFrame.addSubview(percentageView)
        
        percentageView.snp.makeConstraints{
            $0.height.equalTo(66.43)
            $0.top.equalToSuperview().offset(49.33)
            $0.bottom.equalToSuperview().offset(-55.57)
            $0.leading.equalToSuperview().offset(31.37)
            $0.trailing.equalToSuperview().offset(-30.81)
        }
    
    }
    
    @objc func choiceBtnDidClicked(_ sender: UIButton){
        
        self.didVote = true
        
        sender.addSubview(choiceTag)
        
        choiceTag.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-6)
            $0.trailing.equalToSuperview().offset(-6)
            $0.width.equalTo(75)
            $0.height.equalTo(32)
        }
        
    }
}

extension FightTableViewCell{
    
    class PercentageView: UIView{
        
        var highPercentage: CGFloat!
        var lowPercentage: CGFloat!
        
        let highPercentageView = UILabel().then{
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
            $0.layer.cornerRadius  = 16
            $0.clipsToBounds = true
        }
        
        init(type: FightType, top: CGFloat, bottom: CGFloat){
            
            super.init(frame: .zero)
            
            self.highPercentage = top
            
            if(top > bottom){
                highPercentageView.backgroundColor = type.deepColor
                lowPercentageView.backgroundColor = type.lightColor
                
                highPercentageView.text = "\(Int(top))%"
                lowPercentageLabel.text = "\(Int(bottom))%"
            }else{
                highPercentageView.backgroundColor = type.lightColor
                lowPercentageView.backgroundColor = type.deepColor
                
                highPercentageView.text = "\(Int(bottom))%"
                lowPercentageLabel.text = "\(Int(top))%"
            }
            
//            highPercentageView.backgroundColor = type.deepColor
//            lowPercentageView.backgroundColor = type.lightColor
//
//            highPercentageView.text = "\(Int(top))%"
//            lowPercentageLabel.text = "\(Int(bottom))%"
    
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

class FightType{
    var lightColor : UIColor!
    var deepColor: UIColor!
    
    init(light: UIColor, deep: UIColor){
        self.lightColor = light
        self.deepColor = deep
    }
}

class Xgeneration: FightType{
    init(){
        super.init(light: .lightBrown, deep: .deepBrown)
    }

}

class Zgeneration: FightType{
    init(){
        super.init(light: .lightYellow, deep: .deepYellow)
    }

}
