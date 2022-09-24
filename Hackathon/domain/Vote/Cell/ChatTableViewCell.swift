//
//  ChatTableViewCell.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import UIKit
import Then

class FightTableViewCell: UITableViewCell{
    
}

class ChatTableViewCell: UITableViewCell {
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

class ChatTitleViewCell: UITableViewCell{
    
}
