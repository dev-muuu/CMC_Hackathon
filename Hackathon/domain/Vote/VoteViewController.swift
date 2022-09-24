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
            mainView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.addSubview(mainView)
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        
        mainView.snp.makeConstraints{
            //TODO: - top offset 17로 변경
            $0.top.equalToSuperview().offset(50)
            $0.bottom.leading.trailing.equalToSuperview()
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
