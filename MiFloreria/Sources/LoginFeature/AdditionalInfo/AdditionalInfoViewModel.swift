//
//  AdditionalInfoViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 27/02/24.
//

import Foundation
import Firebase
import Combine

struct User {
    typealias UsersDatabase = Constants.Users
    let name: String
    let lastName: String
    let email: String
    let password: String
    let phone: String
    let uid: String
    
    func getDictionary() -> [String: Any] {
        return [
            UsersDatabase.name.rawValue: name + " " + lastName,
            UsersDatabase.email.rawValue: email,
            UsersDatabase.password.rawValue: password.data(using: .utf8)?.base64EncodedString() ?? "",
            UsersDatabase.phone.rawValue: phone,
            UsersDatabase.uid.rawValue: uid
        ]
    }
}

protocol AdditionalInfoProtocol {
    typealias ResultValidation = Result<Bool, Error>
    var additionalInfoTracking: AdditionalInfoAnalytics { get set }
    var registerUserPublisher: PassthroughSubject<ResultValidation, Error> { get }
    
    func saveInfo(with user: User)
}

final class AdditionalInfoViewModel: AdditionalInfoProtocol {
    
    var additionalInfoTracking: AdditionalInfoAnalytics
    var registerUserPublisher = PassthroughSubject<ResultValidation, Error>()
    
    private var userInfo = UserInfo.shared
    private var ref = Database.database().reference()
    
    init(additionalInfoTracking: AdditionalInfoAnalytics) {
        self.additionalInfoTracking = additionalInfoTracking
    }
    
    func saveInfo(with user: User) {
        // TODO: POSIBLES ERRORES
        /// Que la contraseña sea igual a la confirmar contraseña.
        /// Que no exista ningún dato vacío.
        /// Se deben enviar al viewController y mostrar en una alerta.
        userInfo.saveUser(with: user)
        
        ref.child(Constants.Users.users.rawValue).child(user.uid).updateChildValues(user.getDictionary())
        additionalInfoTracking.saveUserTracking(with: user)
        registerUserPublisher.send(.success(true))
    }
}
