//
//  Chip.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/31.
//

import SwiftUI

struct Chip: View {
    
    let text: String
    var color: Color = .blue
    
    
    var body: some View {
        Text(text)
            .font(.caption)
            .colorInvert()
            .padding(7)
            .frame(height: 25, alignment: .center)
            .cornerRadius(2)
            .background(color)
            .clipShape(Capsule())
            
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(text: "20대 남자")
    }
}
