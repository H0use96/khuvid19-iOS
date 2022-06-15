//
//  ReviewCard.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/30.
//

import SwiftUI

struct ReviewCard: View {
    
    struct Input {
        var inoculatedDate: String?
        var sideEffects: [String]?
        var vaccine: String?
        var review: String?
        var gender: String?
        var age: String?
    }
    
    var input: Input
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(input.vaccine ?? "")
                    .font(.body)
                    .fontWeight(.medium)
                Spacer()
                
                if let date = input.inoculatedDate {
                    let endIdx = date.index(date.startIndex, offsetBy: 10)
                    Text(date[date.startIndex..<endIdx])
                        .font(.caption)
                }
            }
            
            
            HStack {
                if let gender = input.gender {
                    Chip(text: gender, color: .green)
                }
                
                if let age = input.age {
                    Chip(text: age, color: .green)
                }
            }
            
            HStack {
                ForEach(input.sideEffects ?? [], id: \.self) { str in
                    Chip(text: str)
                }
            }
            
            if let review = input.review {
                Spacer()
                    .frame(height: 30)
                
                Text(review)
                    .font(.footnote)
            }
            
            
        }
        .padding(40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
                .padding()
        )
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(input: .init(inoculatedDate: "2021-09-07T00:00:00.000+00:00", sideEffects: ["고열", "초고열"], vaccine: "화이자 1차", review: "너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요 너무 아파요", gender: "남성", age: "20대"))
            .padding()
    }
}
