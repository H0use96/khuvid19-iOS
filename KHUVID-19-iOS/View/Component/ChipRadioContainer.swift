//
//  ChipContainer.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/04.
//

import SwiftUI

struct ChipRadioContainer: View {
    
    @Binding var selectedID: Int?
    
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
                        ChipRadioButton(id: chipData.id, title: chipData.title, selectedID: $selectedID)
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

struct ChipRadioContainer_Previews: PreviewProvider {
    static var previews: some View {
        ChipRadioContainer(selectedID: .constant(1), data: [
            .init(id: 1, title: "HELLO"),
            .init(id: 2, title: "HELLO"),
            .init(id: 3, title: "HELLO"),
            .init(id: 4, title: "HELLO"),
            .init(id: 5, title: "HELLO"),
            .init(id: 6, title: "HELLO"),
            .init(id: 7, title: "HELLO"),
            .init(id: 8, title: "HELLO"),
            .init(id: 9, title: "HELLO"),
            .init(id: 10, title: "HELLO"),
            
        ])
            .previewLayout(.sizeThatFits)
    }
}
