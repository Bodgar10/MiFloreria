//
//  PhoneAnalytics.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 05/03/24.
//

import Firebase

protocol PhoneAnalytics {
    func viewDidLoadTracking()
    func buttonTappedTracking(with buttonTapped: String)
    func errorTracking(with errorMessage: String)
}

final class PhoneFirebaseTracking: PhoneAnalytics {
    
    func viewDidLoadTracking() {
        Analytics.logEvent("phone_screen", parameters: nil)
    }
    
    func buttonTappedTracking(with buttonTapped: String) {
        Analytics.logEvent("phone_screen", parameters: ["buttonTapped": buttonTapped])
    }
    
    func errorTracking(with errorMessage: String) {
        Analytics.logEvent("phone_screen", parameters: ["errorMessage": errorMessage])
    }
}
