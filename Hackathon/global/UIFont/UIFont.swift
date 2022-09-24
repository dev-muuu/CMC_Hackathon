//
//  UIFont.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/24.
//

import Foundation
import UIKit

extension UIFont{
    
    enum Family: String {
        case Bold, Medium, Regular
    }

    static func notosans(size: CGFloat, family: Family) -> UIFont! {
        guard let font: UIFont = UIFont(name: "NotoSansKR-\(family)", size: size) else{
            return nil
        }
        return font
    }
}
