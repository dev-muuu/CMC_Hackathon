//
//  CustomGroupZTableViewCell.swift
//  Hackathon
//
//  Created by 김사랑 on 2022/09/25.
//

import UIKit

class CustomGroupZTableViewCell: UITableViewCell {
    
    var count: Int = 0

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var countBorderView: UIButton!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        self.countBorderView?.layer.cornerRadius = 10
        self.countBorderView?.layer.borderWidth = 2
        self.countBorderView?.backgroundColor = .black
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
