//
//  SideEffectsRankingView.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/06.
//

import SwiftUI

struct SideEffectsRankingView: View {
    
    @State private var selectIdx: Int?
    @State private var ranks: [(String, Int)] = []
    
    private let vaccines = Info.shared.vaccines
    
    var body: some View {
        
        Text("백신 별 부작용을 확인해보세요!")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 40)
        
        ChipRadioContainer(selectedID: $selectIdx, data: vaccines.enumerated().map { idx, vaccine in
            return .init(id: idx, title: vaccine.value)
        })
            .onChange(of: selectIdx, perform: { newValue in
                Task {
                    guard let ranks = await Repository.shared.getSideEffect(by: vaccines[selectIdx ?? 0])?.getRank() else { return }
                    self.ranks = ranks.map { return ($0.0, $0.1)}
                }
            })
        
        ForEach(ranks, id: \.self.0) { (key, value) in
            HStack {
                Text(key)
                Spacer()
                Text("\(value)")
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 20)
        }
        
        Spacer(minLength: 100)
        
    }
}

struct SideEffectsRankingView_Previews: PreviewProvider {
    static var previews: some View {
        SideEffectsRankingView()
    }
}
