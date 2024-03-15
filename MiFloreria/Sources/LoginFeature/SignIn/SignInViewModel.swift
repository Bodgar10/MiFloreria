//
//  SignInViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 08/02/24.
//

import Foundation
import FirebaseAuth
import Combine

protocol FlorezAnalytics {
    var phoneTracking: PhoneAnalytics { get set }
    
    func viewDidLoad()
}

protocol VerifyPhone: FlorezAnalytics {
    typealias ResultValidation = Result<String, Error>
    var verificationPhonePublisher: PassthroughSubject<ResultValidation, Error> { get }
    
    func verifyPhoneNumber(with phone: String?)
}

protocol SignIn: FlorezAnalytics {
    typealias ResultSignIn = Result<String, Error>
    var signInPublisher: PassthroughSubject<ResultSignIn, Error> { get }
    
    func signIn(verificationId: String, verificationCode: String)
}

final class SignInViewModel: VerifyPhone {
    var phoneTracking: PhoneAnalytics
    var signInPublisher = PassthroughSubject<ResultSignIn, Error>()
    
    // MARK: Initializer
    
    init(phoneTracking: PhoneAnalytics) {
        self.phoneTracking = phoneTracking
    }
    
    // MARK: Verify Phone Protocol
    var verificationPhonePublisher = PassthroughSubject<ResultValidation, Error>()
    
    func verifyPhoneNumber(with phone: String?) {
        phoneTracking.buttonTappedTracking(with: "Next_Button")
        guard let phone = phone, hasValidLong(numberPhone: phone) else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber("+52\(phone)", uiDelegate: nil) { [weak self] verificationId, error in
            if let error = error {
                self?.phoneTracking.errorTracking(with: error.localizedDescription)
                self?.verificationPhonePublisher.send(.failure(error))
            } else if let verificationId = verificationId {
                self?.verificationPhonePublisher.send(.success(verificationId))
            }
        }
    }
    
    private func hasValidLong(numberPhone: String) -> Bool {
        if numberPhone.isEmpty {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Escribe un número telefónico."])
            self.phoneTracking.errorTracking(with: error.localizedDescription)
            verificationPhonePublisher.send(.failure(error))
            return false
        } else if numberPhone.count < 10 {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El teléfono debe contener 10 números."])
            self.phoneTracking.errorTracking(with: error.localizedDescription)
            verificationPhonePublisher.send(.failure(error))
            return false
        }
        return true
    }
    
    func viewDidLoad() {
        phoneTracking.viewDidLoadTracking()
    }
}

extension SignInViewModel: SignIn {
    
    // MARK: SignIn Protocol
    
    func signIn(verificationId: String, verificationCode: String) {
        self.phoneTracking.buttonTappedTracking(with: "SignIn")
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: verificationId,
          verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            if let error = error {
                self?.phoneTracking.errorTracking(with: error.localizedDescription)
                self?.signInPublisher.send(.failure(error))
            } else {
                self?.signInPublisher.send(.success(result?.user.uid ?? ""))
            }
        }
    }
}
