//
//  detailPostViewController.swift
//  Hackathon
//
//  Created by 양채연 on 2022/09/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class DetailPostViewController: UIViewController {

    // MARK: - Property
    
    
    let mainView = DetailPostView()
    
    var chatData: [Int] = [1,2,3,4,5] //default = []

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.addSubview(mainView)
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}




extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return chatData.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier, for: indexPath) as? UserTableViewCell else { fatalError() }
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPostTableViewCell.cellIdentifier, for: indexPath) as? DetailPostTableViewCell else { fatalError() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellIdentifier, for: indexPath) as? CommentTableViewCell else { fatalError() }
            return cell
        }
    }
}
