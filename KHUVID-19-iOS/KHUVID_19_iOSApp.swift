//
//  KHUVID_19_iOSApp.swift
//  KHUVID-19-iOS
//
//  Created by KHU_TAEWOO on 2022/05/30.
//

import SwiftUI
import UserNotifications

@main
struct KHUVID_19_iOSApp: App {
    
    let userNotiCenter = UNUserNotificationCenter.current()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        let sideEffects = await Repository.shared.getSideEffects()
                        let vaccines = await Repository.shared.getVaccines()
                        let counts = await Repository.shared.getCurrentSituation()
                        Info.shared.vaccines = vaccines
                        Info.shared.sideEffects = sideEffects
                        Info.shared.genders = await Repository.shared.getGenderTypes()
                        Info.shared.ages = await Repository.shared.getAgeTypes()
                        
                    }
                }
                
        }
    }
}
