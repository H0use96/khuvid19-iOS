//
//  FilterCard.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/31.
//

import SwiftUI

struct RadioFilterCard: View {
    
    let title: String
    let data: [String]
    
    @Binding var selectIdx: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            ChipRadioContainer(selectedID: $selectIdx, data: data.enumerated().map { idx, title in
                .init(id: idx, title: title)
            })
        }
        .padding()
        .padding(.horizontal)
        .frame(minHeight: 100, alignment: .center)
    }
}

struct RadioFilterCard_Previews: PreviewProvider {
    static var previews: some View {
        RadioFilterCard(title: "백신 종류", data: ["화이자 1차", "화이자 2차", "AZ 1차", "AZ 2차"], selectIdx: .constant(1))
    }
}
