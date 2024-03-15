//
//  AdditionalInfoAnalytics.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 05/03/24.
//

import Firebase

protocol AdditionalInfoAnalytics {
    func viewDidLoadTracking()
    func buttonTappedTracking(with buttonTapped: String)
    func saveUserTracking(with user: User)
}

final class AdditionalInfoFirebaseTracking: AdditionalInfoAnalytics {
    
    func viewDidLoadTracking() {
        Analytics.logEvent("additional_info_screen", parameters: nil)
    }
    
    func buttonTappedTracking(with buttonTapped: String) {
        Analytics.logEvent("additional_info_screen", parameters: ["buttonTapped": buttonTapped])
    }
    
    func saveUserTracking(with user: User) {
        Analytics.logEvent("additional_info_screen", parameters: user.getDictionary())
    }
}
