//
//  ConfirmPassViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 11/04/24.
//

import Foundation

final class ConfirmPassViewModel {
    private var currentPassword: String
    
    init(currentPassword: String) {
        self.currentPassword = currentPassword
    }
    
    public func verifyPassword(with password: String) -> Bool {
        currentPassword == password.data(using: .utf8)?.base64EncodedString()
    }
}
