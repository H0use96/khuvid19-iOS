//
//  FilterCard.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/31.
//

import SwiftUI

struct FilterCard: View {
    
    let title: String
    let data: [String]
    
    @Binding var selectIdxs: [Int]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            ChipContainer(selectedIDs: $selectIdxs, data: data.enumerated().map { idx, title in
                .init(id: idx, title: title)
            })
        }
        .padding()
        .padding(.horizontal)
        .frame(minHeight: 100, alignment: .center)
    }
}
