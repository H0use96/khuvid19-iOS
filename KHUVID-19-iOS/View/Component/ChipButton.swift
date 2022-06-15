//
//  ChipButton.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/31.
//

import SwiftUI

struct ChipButton: View {
    
    let id: Int
    let title: String
    
    @Binding var selectedIDs: [Int]
    
    var body: some View {
        Button {
            if let foundIdx = selectedIDs.firstIndex(of: id) {
                selectedIDs.remove(at: foundIdx)
            } else {
                selectedIDs.append(id)
            }
        } label: {
            Text(title)
                .fontWeight(.bold)
                .font(.caption)
                .padding()
                .foregroundColor(selectedIDs.contains(id) ? .white : .black)
                .foregroundColor(selectedIDs.contains(id) ? .white : .black)
                .background(selectedIDs.contains(id) ? .blue : .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .cornerRadius(40)
                
        }
    }
}
