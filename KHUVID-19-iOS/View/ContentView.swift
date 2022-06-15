//
//  ContentView.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var simpleReviews: [SimpleReviewDTO] = []
    @State private var showWriteReview: Bool = false {
        didSet {
            if !showWriteReview {
                Task {
                    let result = await Repository.shared.getSimpleReviewList()
                    print(result)
                    simpleReviews = result
                }
            }
        }
    }
    
    @State private var showSideEffects: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            ScrollView {
                
                VStack {
                    Spacer()
                    Button {
                        Task {
                            let counts = await Repository.shared.getCurrentSituation()
                            let diff = counts[1].todayCnt - counts[0].todayCnt
                            let manager = LocalNotificationManager()
                            manager.requestPermission {
                                manager.addNoti(title: "오늘은 어제보다 확진자가 \(abs(diff))만큼 \(diff > 0 ? "증가" : "감소")했어요!")
                                manager.scheduleNoti()
                            }
                        }
                    } label: {
                        Image(systemName: "bell")
                    }

                }
                
                VStack {
                    Text("KHUVID-19")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text("오늘도 안전하게..!")
                        .font(.subheadline)
                }
                .padding(.bottom, 40)
                .padding(.top, 20)
                
                
                SituationView()
                    .padding(.bottom, 30)
                
                HStack {
                    Text("부작용")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button {
                        showSideEffects = true
                    } label: {
                        Text("확인하기")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(15)
                
                HStack {
                    Text("리뷰 목록")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button {
                        showWriteReview = true
                    } label: {
                        Text("작성하기")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(15)
                
                
                ForEach(simpleReviews) { review in
                    ReviewCard(input: .init(
                        inoculatedDate: review.inoculatedDate,
                        sideEffects: review.sideEffects?.map {
                            Info.shared.getSideEffectKorean(to: $0)
                        },
                        vaccine: review.vaccine.map{
                            Info.shared.getVaccineKorean(to: $0)
                        },
                        review: review.detailDisc,
                        gender: Info.shared.getGenderKorean(to: review.authorGender ?? ""),
                        age: Info.shared.getAgeKorean(to: review.authorAge ?? "")
                    ))
                }
            }
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                Task {
                    let result = await Repository.shared.getSimpleReviewList()
                    print(result)
                    simpleReviews = result
                }
            }
            
            
        }
        .sheet(isPresented: $showWriteReview, onDismiss: {
            showWriteReview = false
        }) {
            WriteReviewView()
        }
        .sheet(isPresented: $showSideEffects, onDismiss: {
            showSideEffects = false
        }) {
            SideEffectsRankingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
