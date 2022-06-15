//
//  ChipContainer.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/04.
//

import SwiftUI

struct ChipContainer: View {
    
    @Binding var selectedIDs: [Int]
    
    struct Data: Identifiable {
        let id: Int
        let title: String
    }
    
    let data: [Data]
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
    
        return ZStack {
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    ForEach(data) { chipData in
                        ChipButton(id: chipData.id, title: chipData.title, selectedIDs: $selectedIDs)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 7)
                            .alignmentGuide(.leading) { dimension in
                                if abs(width - dimension.width) > geo.size.width {
                                    width = 0
                                    height -= dimension.height
                                }
                                
                                let result = width
                                
                                if chipData.id == data.last!.id {
                                    width = 0
                                } else {
                                    width -= dimension.width
                                }
                                
                                return result
                            }
                            .alignmentGuide(.top) { dimension in
                                let result = height
                                if chipData.id == data.last!.id {
                                    height = 0
                                }
                                
                                return result
                            }
                    }
                }
            }
        }
    }
}
