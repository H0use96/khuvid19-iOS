//
//  Enums.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/04.
//

import Foundation

class Info {
    public static let shared = Info()
    
    public var vaccines: [Vaccine] = []
    public var sideEffects: [SideEffect] = []
    public var ages: [Age] = []
    public var genders: [Gender] = []
    
    public func getVaccineKorean(to key: String) -> String {
        return vaccines.first { $0.code == key }?.value ?? ""
    }
    
    public func getSideEffectKorean(to key: String) -> String {
        return sideEffects.first { $0.code == key }?.value ?? ""
    }
    
    public func getAgeKorean(to key: String) -> String {
        return ages.first { $0.code == key }?.value ?? ""
    }
    
    public func getGenderKorean(to key: String) -> String {
        return genders.first { $0.code == key }?.value ?? ""
    }
    
}

struct Vaccine: Codable {
    let code: String
    let value: String
}

struct SideEffect: Codable {
    let code: String
    let value: String
}

struct Age: Codable {
    let code: String
    let value: String
}

struct Gender: Codable {
    let code: String
    let value: String
}


