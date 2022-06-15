//
//  SubmitReviewDTO.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/05.
//

import Foundation

struct SubmitReviewDTO: Codable {
    let detailDisc: String
    let diseaseDisc: String
    let etcSideEffect: String
    let haveDisease: Bool
    let id: Int
    let inoculatedDate: String
    let sideEffects: [String]
    let vaccine: String
}
