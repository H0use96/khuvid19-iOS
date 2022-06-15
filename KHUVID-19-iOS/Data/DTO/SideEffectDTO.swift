//
//  SideEffectDTO.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/06.
//

import Foundation

struct SideEffectDTO: Codable {
    let totalPeopleCount: Int?
    let sideEffects: [String: Int]
    
    func getRank() -> [(String, Int)] {
        return sideEffects.map { (key: String, value: Int) -> (String, Int) in
            let korean = Info.shared.getSideEffectKorean(to: key)
            return (korean, value)
        }
        .sorted { $0.1 > $1.1 }
    }
}


