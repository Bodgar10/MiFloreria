//
//  SignInViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 08/02/24.
//

import Foundation
import FirebaseAuth
import Combine

protocol SignIn {
    typealias ResultValidation = Result<String, Error>
    var verificationPhonePublisher: CurrentValueSubject<ResultValidation, Error> { get }
    func verifyPhoneNumber(with phone: String?)
}

final class SignInViewModel: SignIn {
    var verificationPhonePublisher = CurrentValueSubject<ResultValidation, Error>(.success(""))
    
    func verifyPhoneNumber(with phone: String?) {
        guard let phone = phone, hasValidLong(numberPhone: phone) else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber("+52\(phone)", uiDelegate: nil) { [weak self] verificationId, error in
            if let error = error {
                self?.verificationPhonePublisher.send(.failure(error))
            } else if let verificationId = verificationId {
                self?.verificationPhonePublisher.send(.success(verificationId))
            }
        }
    }
    
    private func hasValidLong(numberPhone: String) -> Bool {
        if numberPhone.isEmpty {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Escribe un número telefónico."])
            verificationPhonePublisher.send(.failure(error))
            return false
        } else if numberPhone.count < 10 {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El teléfono debe contener 10 números."])
            verificationPhonePublisher.send(.failure(error))
            return false
        }
        return true
    }
}


