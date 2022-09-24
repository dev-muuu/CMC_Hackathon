//
//  GroupZViewController.swift
//  Hackathon
//
//  Created by 김사랑 on 2022/09/25.
//

import UIKit

class GroupZViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var titleArr: [String] = ["10분 일찍 와서 준비하라는 과장님",
                              "편의점알바생한테 반말로 답하는 엄마",
                              "꼭 메뉴를 통일해서 시키자는 대리님",
                              "인사법 지적하는 부장님",
                              "0"]
    var contentArr: [String] = ["출근 1주일 차입니다. 나참, 과장님이 10분 일찍 와서 준비하라고 하시더라구요.",
                                "내 얼굴이 화끈거리더라구요.",
                                "밥 메뉴를 시킬 때 마다 반 강요적으로 먹을 수 밖에 없는 분위기를 만들어요. 그.. ",
                                "항상 사람들이 들어올때마다 “어서오세요”라고 인사했는데, 부장님이 그걸 듣고.. ",
                                "0"]
    var countEmojiArr: [String] = ["3", "3", "0", "0", "0"]
    var TimeArr: [String] = ["35분 전", "43분 전", "50분 전", "1시간 전", "0시간 전"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CustomGroupZTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomGroupZTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomGroupZTableViewCell", for: indexPath) as! CustomGroupZTableViewCell
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
