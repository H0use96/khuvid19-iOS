//
//  ChipButton.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/31.
//

import SwiftUI

struct ChipRadioButton: View {
    
    let id: Int
    let title: String
    
    @Binding var selectedID: Int?
    
    var body: some View {
        Button {
            selectedID = id
        } label: {
            Text(title)
                .fontWeight(.bold)
                .font(.caption)
                .padding()
                .foregroundColor(selectedID == id ? .white : .black)
                .foregroundColor(selectedID == id ? .white : .black)
                .background(selectedID == id ? .blue : .white)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .cornerRadius(40)
                
        }
    }
}

struct ChipButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ChipRadioButton(id: 1, title: "ABCDE", selectedID: .constant(1))
    }
}
