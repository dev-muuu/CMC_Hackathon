//
//  GroupXViewController.swift
//  Hackathon
//
//  Created by 김사랑 on 2022/09/25.
//

import UIKit

class GroupXViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var GX_tableView: UITableView!
    
    @IBOutlet weak var GX_groupZBtn: UIButton!
    @IBOutlet weak var GX_groupXBtn: UIButton!
    
    @IBOutlet weak var GX_borderGroupZView: UIView!
    @IBOutlet weak var GX_borderGroupXView: UIView!

    @IBOutlet weak var GX_homeBtn: UITabBarItem!
    
    var titleArr: [String] = ["교복입고 담배피는 학생들",
                              "수업 시간에 군것질하는 학생",
                              "집에서 큰 소리로 노래하는 딸 ",
                              "퇴근시간 5분 전부터 짐 챙기는 신입",
                              "0"]
    var contentArr: [String] = ["어제 교복입고 당당하게 담배피는 아이들을 보아 지적을 하였더니 되려 짜증을 내..",
                                "고등학교 교사입니다. 저희 반 학생 한 명이 아침을 안 먹고 교실에서 군것질하네..",
                                "19살 딸 가진 엄마입니다 저희 딸이 시도때도 없이 집에서 노래를 부르는데 고3..",
                                "저희 회사 신입이 일도 덜 끝냈는데 짐부터 미리 챙기네요.. 저번에 한 번 한소리..",
                                "0"]
    var countEmojiArr: [String] = ["3", "3", "0", "0", "0"]
    var TimeArr: [String] = ["35분 전", "43분 전", "50분 전", "1시간 전", "0시간 전"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0
     
    private let GX_floatingBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.backgroundColor = .black
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .medium))
        button.setImage(image, for: .normal)
        button.setTitle("글쓰기", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        button.layer.cornerRadius = 30
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(GX_floatingBtn)
        GX_floatingBtn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)

        let nib = UINib(nibName: "CustomGroupXTableViewCell", bundle: nil)
        GX_tableView.register(nib, forCellReuseIdentifier: "CustomGroupXTableViewCell")
        GX_tableView.delegate = self
        GX_tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GX_floatingBtn.frame = CGRect(x: view.frame.size.width - 130, y: view.frame.size.height - 150, width: 108, height: 41)
    }
    
    @objc private func didTapBtn() {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "XWritePostVC") as? XWritePostViewController else { return }
                
            nextVC.modalTransitionStyle = .coverVertical
            nextVC.modalPresentationStyle = .overFullScreen
                
            self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func GroupZBtnDidTap(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "GroupZVC") as? GroupZViewController else { return }
                
            nextVC.modalTransitionStyle = .coverVertical
            nextVC.modalPresentationStyle = .fullScreen
                
            self.present(nextVC, animated: false, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomGroupXTableViewCell", for: indexPath) as! CustomGroupXTableViewCell
        cell.titleLbl?.text = titleArr[indexPath.row]
        cell.contentLbl?.text = contentArr[indexPath.row]
        cell.timeLbl?.text = TimeArr[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }

        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // note that indexPath.section is used rather than indexPath.row
            print("You tapped cell number \(indexPath.section).")
        }
}
