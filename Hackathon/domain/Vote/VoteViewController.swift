//
//  VoteViewController.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit

class VoteViewController: UIViewController {
    
    let mainView = VoteView()
    
    var chatData: [String] = ["1","2","3","4","5"] //default = []
    
    var currentTitle: IndexPath = [0,0]{
        didSet{
            VoteDataManager().getUserVote(viewController : self, userId: Const.userId, type: currentTitle)
        }
    }
    
    var voteInfo: UserVoteResult!{
        didSet{
            mainView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(mainView)
        
        mainView.titleCollectionView.dataSource = self
        mainView.titleCollectionView.delegate = self
        mainView.titleCollectionView.allowsMultipleSelection = false
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        
        mainView.chatTextfield.delegate = self
        
        mainView.snp.makeConstraints{
            //TODO: - top offset 17로 변경
            $0.top.equalToSuperview().offset(50)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        VoteDataManager().getUserVote(viewController : self, userId: Const.userId, type: currentTitle)
    }
    
    //MARK: - API
    
    func successApiGet(result: UserVoteResult){
        voteInfo = result
    }
    
    func successApiVotePost(result: UserVoteResult){
        voteInfo = result
    }
    
    func successApiPostComment(){
        mainView.chatTextfield.text = ""
//        voteInfo.comments.app
    }

}

extension VoteViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if(textField.text == ""){
            return false
        }
        let parameter = CommentInput(content: textField.text!, userID: Const.userId)
        CommentDataManager().commentPost(viewController: self, parameter, voteId: voteInfo.voteId)
        return true
    }
    
}

extension VoteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VoteTitleCollectionViewCell.cellIdentifier, for: indexPath) as? VoteTitleCollectionViewCell else { fatalError() }
        if(currentTitle == indexPath){
            collectionView.selectItem(at: currentTitle, animated: false, scrollPosition: .left)
        }else{
            cell.isSelected = false
        }
        cell.titleLabel.text = indexPath.row == 0 ? "노란싹수배틀" : "라떼 배틀"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Const.DEVICE_WIDTH - 20) / 2, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.currentTitle = collectionView.indexPathsForSelectedItems![0]
        
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
        if(voteInfo == nil){
            return 0
        }
        return voteInfo.selectTopic == 0 ? 1 : chatData.count + 1
//        return chatData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FightTableViewCell.cellIdentifier, for: indexPath) as? FightTableViewCell else { fatalError() }
            cell.superViewController = self
            cell.titleLabel.text = currentTitle == [0,0] ? "누가 더 싹수가 노란가" : "누가 더 라떼인가"
            cell.type = currentTitle == [0,0] ? Zgeneration() : Xgeneration()
            cell.voteData = voteInfo
            
            switch cell.voteData.selectTopic{
            case 0:
                cell.willShowVersusView()
            default:
                cell.willShowPercentageView()
            }
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellIdentifier, for: indexPath) as? CommentTableViewCell else { fatalError() }
            return cell
        }
    }
}
