//
//  ReviewDTO.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/04.
//

import Foundation

struct SimpleReviewResponseDTO: Codable {
    let content: [SimpleReviewDTO]
}

struct SimpleReviewDTO: Codable, Identifiable {
    let id: Int?
    let authorId: Int?
    let authorGender: String?
    let authorNickName: String?
    let vaccine: String?
    let authorAge: String?
    let inoculatedDate: String?
    let sideEffects: [String]?
    let detailDisc: String?
}

