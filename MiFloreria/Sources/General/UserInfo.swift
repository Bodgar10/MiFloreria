//
//  UserInfo.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 27/02/24.
//

import Foundation

final class UserInfoConstants {
    
    private init() {}
    
    static var uid = "UID"
    static var email = "Email"
    static var name = "Name"
    static var password = "Password"
    static var phone = "Phone"
}

///Singleton
final class UserInfo {
    
    /// Inicializas tu clase de manera interna en una static var.
    /// shared | instance | standard
    static var shared: UserInfo {
        UserInfo()
    }
    
    private var userDefault = UserDefaults.standard
    
    private init() {}
    
    var getUID: String {
        guard let uid = userDefault.string(forKey: UserInfoConstants.uid),
                let decodedUID = Data(base64Encoded: uid) else { return "" }
        return String(data: decodedUID, encoding: .utf8) ?? ""
    }
    
    var getEmail: String {
        guard let email = userDefault.string(forKey: UserInfoConstants.email) else { return "" }
        return email
    }
    
    var getName: String {
        guard let name = userDefault.string(forKey: UserInfoConstants.name) else { return "" }
        return name
    }
    
    var getPassword: String {
        guard let password = userDefault.string(forKey: UserInfoConstants.password),
                let decodedPassword = Data(base64Encoded: password) else { return "" }
        return String(data: decodedPassword, encoding: .utf8) ?? ""
    }
    
    var getPhone: String {
        guard let phone = userDefault.string(forKey: UserInfoConstants.phone) else { return "" }
        return phone
    }
    
    func saveUser(with user: User) {
        saveUID(with: user.uid)
        saveEmail(with: user.email)
        saveName(with: user.name)
        savePassword(with: user.password)
        savePhone(with: user.phone)
    }
    
    func saveUID(with uid: String) {
        let uidEncoded = uid.data(using: .utf8)?.base64EncodedString()
        userDefault.set(uidEncoded, forKey: UserInfoConstants.uid)
    }
    
    func saveEmail(with email: String) {
        userDefault.set(email, forKey: UserInfoConstants.email)
    }
    
    func saveName(with name: String) {
        userDefault.set(name, forKey: UserInfoConstants.name)
    }
    
    func savePassword(with password: String) {
        let passwordEncoded = password.data(using: .utf8)?.base64EncodedString()
        userDefault.set(passwordEncoded, forKey: UserInfoConstants.password)
    }
    
    func savePhone(with phone: String) {
        userDefault.set(phone, forKey: UserInfoConstants.phone)
    }
    
    func removeAll() {
        userDefault.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
        userDefault.synchronize()
    }
}
