//
//  VoteViewController.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit

class VoteViewController: UIViewController {
    
    let mainView = VoteView()
    
    var chatData: [Int] = [1,2,3,4,5] //default = []
    
    var didVote = false{
        didSet{
            
            guard let cell = mainView.contentCollectionView.cellForItem(at: currentTitle) as? VoteCollectionViewCell else { fatalError()
            }
            cell.tableView.reloadData()
        }
    }
    
    var currentTitle: IndexPath = [0,0]

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.addSubview(mainView)
        
        mainView.titleCollectionView.dataSource = self
        mainView.titleCollectionView.delegate = self
        mainView.titleCollectionView.allowsMultipleSelection = false
        
        mainView.contentCollectionView.delegate = self
        mainView.contentCollectionView.dataSource = self
        
        mainView.snp.makeConstraints{
            //TODO: - top offset 17로 변경
            $0.top.equalToSuperview().offset(50)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}

extension VoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == mainView.titleCollectionView){
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VoteTitleCollectionViewCell.cellIdentifier, for: indexPath) as? VoteTitleCollectionViewCell else { fatalError() }
            if(currentTitle == indexPath){
                collectionView.selectItem(at: currentTitle, animated: false, scrollPosition: .left)
            }else{
                cell.isSelected = false
            }
            cell.titleLabel.text = indexPath.row == 0 ? "노란싹수배틀" : "라떼 배틀"
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VoteCollectionViewCell.cellIdentifier, for: indexPath) as? VoteCollectionViewCell else { fatalError() }
            cell.tableView.dataSource = self
            cell.tableView.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == mainView.titleCollectionView){
            return CGSize(width: (Const.DEVICE_WIDTH - 20) / 2, height: 65)
            
        }else{
            return CGSize(width: Const.DEVICE_WIDTH, height: Const.DEVICE_HEIGTH - (112 + 30))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("cell select?")
        self.currentTitle = collectionView.indexPathsForSelectedItems![0]
        print(collectionView.indexPathsForSelectedItems)
        
        if collectionView == mainView.titleCollectionView {
            
            guard let cell = collectionView.cellForItem(at: indexPath) as? VoteTitleCollectionViewCell else { fatalError() }
            
            mainView.tabLineView.snp.remakeConstraints{
                $0.leading.equalTo(cell.snp.leading)
                $0.height.equalTo(3)
                $0.top.equalTo(collectionView.snp.bottom)
                let size = (Const.DEVICE_WIDTH - 66) / 2
                $0.width.equalTo(size)
            }
            
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
}

extension VoteViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return chatData.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FightTableViewCell.cellIdentifier, for: indexPath) as? FightTableViewCell else { fatalError() }
            cell.superViewController = self
            didVote ? cell.willShowPercentageView() : cell.willShowVersusView()
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTitleViewCell.cellIdentifier, for: indexPath) as? ChatTitleViewCell else { fatalError() }
            cell.chatCount = self.chatData.count
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.cellIdentifier, for: indexPath) as? ChatTableViewCell else { fatalError() }
            return cell
        }
    }
}
