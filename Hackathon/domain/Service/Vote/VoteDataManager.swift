//
//  VoteDataManager.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import Foundation
import Alamofire

class VoteDataManager{
    
    
    let headers : HTTPHeaders = [.authorization(Const.accessToken)]
    
    func getUserVote(viewController : VoteViewController, userId: Int, type: IndexPath) {
        
        let serviceType = type == [0,0] ? "z" : "x"
        
        AF.request("https://dongmoo.shop/api/v1/vote/\(serviceType)/\(Const.userId)", method: .get, parameters: nil, headers: headers).validate().responseDecodable(of: VoteModel.self) { response in
            switch response.result {
            case .success(let result):
                switch result.code{
                case 200:
                    print("성공?")
                    viewController.successApiGet(result: result.result)
                default:
                    print(result.code)
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func votePost(viewController: VoteViewController, _ parameter: VoteInput, voteId: String){
        
        AF.request("https://dongmoo.shop/api/v1/vote/\(voteId)/check", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: headers, interceptor: Interceptor()).validate().responseDecodable(of: VoteModel.self) { response in
            switch response.result {
            case .success(let result):
                switch result.code{
                case 1000:
                    viewController.successApiVotePost(result: result.result)
                default:
                    return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
