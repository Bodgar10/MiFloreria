//
//  SignInViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 08/02/24.
//

import Foundation
import FirebaseAuth
import Combine

protocol VerifyPhone {
    typealias ResultValidation = Result<String, Error>
    var verificationPhonePublisher: PassthroughSubject<ResultValidation, Error> { get }
    
    func verifyPhoneNumber(with phone: String?)
}

protocol SignIn {
    typealias ResultSignIn = Result<String, Error>
    var signInPublisher: PassthroughSubject<ResultSignIn, Error> { get }
    
    func signIn(verificationId: String, verificationCode: String)
}

final class SignInViewModel: VerifyPhone {
    var signInPublisher = PassthroughSubject<ResultSignIn, Error>()
    
    // MARK: Verify Phone Protocol
    var verificationPhonePublisher = PassthroughSubject<ResultValidation, Error>()
    
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

extension SignInViewModel: SignIn {
    
    // MARK: SignIn Protocol
    
    func signIn(verificationId: String, verificationCode: String) {
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: verificationId,
          verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            if let error = error {
                self?.signInPublisher.send(.failure(error))
            } else {
                self?.signInPublisher.send(.success(result?.user.uid ?? ""))
            }
        }
    }
}
