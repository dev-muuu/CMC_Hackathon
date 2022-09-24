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

class detailPostViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    }
    
    // MARK: - Property
    
    private lazy var tableview: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self

        tableView.register(commentTableViewCell.self, forCellReuseIdentifier: "CommentTableViewCell")

        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // Do any additional setup after loading the view.
    }

}

extension detailPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? commentTableViewCell
        cell?.selectionStyle = .none
        cell?.setup()
   

        return cell ?? UITableViewCell()
    }

}

private extension detailPostViewController {
    func setupTableView() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
//        tableView.snp.makeConstraints{
//            $0.edges.equalToSuperview()}
    }
}

