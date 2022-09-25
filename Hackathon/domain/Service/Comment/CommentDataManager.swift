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
        print("파라미터 점검", parameter)
        AF.request("https://dongmoo.shop/api/v1/vote/\(voteId)/comment", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: headers, interceptor: Interceptor()).validate().responseDecodable(of: VoteCommentModel.self) { response in
            switch response.result {
            case .success(let result):
                switch result.code{
                case 200:
                    viewController.successApiPostComment(commentData: result.result!)
                default:
                    return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
