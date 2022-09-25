//
//  VoteModel.swift
//  Hackathon
//
//  Created by 박지윤 on 2022/09/25.
//

import Foundation

enum VoteType: String{
    case X = "x"
    case Z = "z"
}

struct VoteModel: Decodable{
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: UserVoteResult
}

struct UserVoteResult: Decodable{
    var commentCount: Int
    var comments: [CommentResult]
    var percent1: Int
    var percent2: Int
    var selectTopic: Int
    var topic1: String
    var topic2: String
    var voteId: Int
}

struct CommentResult: Decodable{
    let content: String
    let createdDate: String
    let nickname: String
    let userGeneration: String
}

struct VoteCommentModel: Decodable{
    let code: Int
    let isSuccess: Bool
    let message: String
    let result: CommentResult?
}
