//
//  CommentModel.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import Foundation

struct ApiModel: Decodable{
    
    var code: Int
    var isSuccess: Bool
    var message: String
}
