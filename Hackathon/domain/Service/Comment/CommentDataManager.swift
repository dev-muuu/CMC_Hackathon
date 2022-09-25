//
//  CommentDataManager.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import Foundation
import Alamofire

class CommentDataManager{
    
    let headers : HTTPHeaders = [.authorization(Const.accessToken)]
    
    func commentPost(viewController: VoteViewController, _ parameter: CommentInput, voteId: Int){
        
        AF.request("https://dongmoo.shop/api/v1/vote/\(voteId)/check", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: headers, interceptor: Interceptor()).validate().responseDecodable(of: ApiModel.self) { response in
            switch response.result {
            case .success(let result):
                switch result.code{
                case 1000:
                    viewController.successApiPostComment()
                default:
                    return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
