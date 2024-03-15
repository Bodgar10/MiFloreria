//
//  HomeAnalytics.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 05/03/24.
//

import Firebase

protocol HomeAnalytics {
    func viewDidLoadTracking()
    func buttonTappedTracking(with buttonTapped: String)
}

final class HomeFirebaseTracking: HomeAnalytics {
    
    func viewDidLoadTracking() {
        Analytics.logEvent("home_screen", parameters: nil)
    }
    
    func buttonTappedTracking(with buttonTapped: String) {
        Analytics.logEvent("home_screen", parameters: ["buttonTapped": buttonTapped])
    }
}
