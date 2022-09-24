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

        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "CommentTableViewCell")

        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        // Do any additional setup after loading the view.
    }

}

extension DetailPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell
//
//        if indexPath.row == 0 {
//            cell?.backgroundColor = .orange
//        }
        cell?.selectionStyle = .none
        cell?.setup()
   

        return cell ?? UITableViewCell()
    }

}

private extension DetailPostViewController {
    func setupTableView() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
//        tableView.snp.makeConstraints{
//            $0.edges.equalToSuperview()}
    }
}

