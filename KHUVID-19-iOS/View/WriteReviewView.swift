//
//  WriteReviewView.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/06/05.
//

import SwiftUI

struct WriteReviewView: View {
    
    @State private var vaccines: [Vaccine] = []
    @State private var sideEffects: [SideEffect] = []
    @State private var selectedVaccineIdx: Int?
    @State private var selectedSideEffectIdx: [Int] = []
    @State private var detailDesc: String = ""
    @State private var date = Date()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                Spacer(minLength: 40)
                DatePicker("접종일자", selection: $date, in: ...Date(),displayedComponents: [.date])
                    .font(.headline)
                    .padding(.horizontal, 30)
                
                RadioFilterCard(title: "백신 종류", data: vaccines.map { $0.value }, selectIdx: $selectedVaccineIdx)
                    .frame(height: 350)
                
                FilterCard(title: "부작용", data: sideEffects.map { $0.value }, selectIdxs: $selectedSideEffectIdx)
                    .frame(height: 300)
                
                VStack(alignment: .leading) {
                    Text("상세 리뷰")
                        .font(.headline)
                    TextEditor(text: $detailDesc)
                        .padding()
                        .border(.black, width: 2)
                        .submitLabel(.send)
                }
                .padding(.horizontal, 30)
                .padding(.top, 70)
                .frame(height: 200)
                    
                
                Button {
                    Task {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "YYYY-MM-dd"
                        let newReview = SubmitReviewDTO(
                            detailDisc: "\(detailDesc)",
                            diseaseDisc: "",
                            etcSideEffect: "",
                            haveDisease: false,
                            id: 175,
                            inoculatedDate: formatter.string(from: date),
                            sideEffects: selectedSideEffectIdx.map { sideEffects[$0].code },
                            vaccine: vaccines[selectedVaccineIdx ?? 0].code
                        )
                        
                        print(newReview)
                        
                        await Repository.shared.postReview(by: newReview)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("작성 완료")
                        .fontWeight(.bold)
                        .frame(width: 350, height: 60)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(.top, 50)
                
            }
        }
        .onTapGesture {
            UIApplication.shared.keyWindow?.endEditing(false)
        }
        .onAppear {
            Task {
                vaccines = await Repository.shared.getVaccines()
                sideEffects = await Repository.shared.getSideEffects()
            }
        }
    }
}

