//
//  AdditionalInfoViewModel.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 27/02/24.
//

import Foundation
import Firebase
import Combine
import UIKit

struct User {
    typealias UsersDatabase = Constants.Users
    let name: String
    let lastName: String
    let email: String
    let password: String
    let confirmpass: String
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
    
    private func validateInfo(with user: User ) -> Bool {
        guard user.password == user.confirmpass else {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Las contraseñas no coinciden."])
            registerUserPublisher.send(.failure(error))
            return false
        }
        
        guard user.password != "" else {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El campo contraseña no puede estar vacío."])
            registerUserPublisher.send(.failure(error))
            return false
        }
         
        guard user.name != "" else {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El campo nombre no puede estar vacío."])
            registerUserPublisher.send(.failure(error))
            return false
        }
        
        guard user.lastName != "" else{
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El campo apellido no puede estar vacío."])
            registerUserPublisher.send(.failure(error))
            return false
        }
         
        guard user.email != "" else {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Error el campo email no puede ir vacó."])
            registerUserPublisher.send(.failure(error))
            return false
        }
        
        return true
    }
    
    func saveInfo(with user: User) {
        // TODO: POSIBLES ERRORES
        /// Que la contraseña sea igual a la confirmar contraseña.
        /// Que no exista ningún dato vacío.
        /// Se deben enviar al viewController y mostrar en una alerta.
        if validateInfo(with: user){
            userInfo.saveUser(with: user)
            
            ref.child(Constants.Users.users.rawValue).child(user.uid).updateChildValues(user.getDictionary())
            additionalInfoTracking.saveUserTracking(with: user)
            registerUserPublisher.send(.success(true))
        }
    }
    
    
}
