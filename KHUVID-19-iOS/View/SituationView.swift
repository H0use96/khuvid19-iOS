//
//  SituationView.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/05.
//

import SwiftUI

struct SituationView: View {
    
    @State private var lastCount: Int = 0
    @State private var curCount: Int = 0
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 30) {
                Text("어제 확진자")
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(lastCount) 명")
            }
            .padding(.all, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
            Spacer()
            VStack(alignment: .center, spacing: 30) {
                Text("오늘 확진자")
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(curCount) 명")
            }
            .padding(.all, 30)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
        .padding(.horizontal, 15)
        .onAppear {
            Task {
                let situations = await Repository.shared.getCurrentSituation()
                self.lastCount = situations[1].todayCnt
                self.curCount = situations[0].todayCnt
            }
        }
        
    }
}

struct SituationView_Previews: PreviewProvider {
    static var previews: some View {
        SituationView()
    }
}
