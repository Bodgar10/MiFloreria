//
//  VerifyCodeAnalytics.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 05/03/24.
//

import Firebase

protocol VerifyCodeAnalytics: PhoneAnalytics {
    
}

final class VerifyCodeFirebaseTracking: VerifyCodeAnalytics {
    
    func viewDidLoadTracking() {
        Analytics.logEvent("verify_code_screen", parameters: nil)
    }
    
    func buttonTappedTracking(with buttonTapped: String) {
        Analytics.logEvent("verify_code_screen", parameters: ["buttonTapped": buttonTapped])
    }
    
    func errorTracking(with errorMessage: String) {
        Analytics.logEvent("verify_code_screen", parameters: ["errorMessage": errorMessage])
    }
}
