//
//  DemoUI.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 23/01/24.
//

import Foundation
import UIKit

final class DemoUI {
    ///
    typealias DemoView = (section: Sections, views: [Views])
    
    enum Sections: String {
        case components = "Components"
        case loginFeatures = "LoginFeature"
        case feedFeature = "FeedFeature"
        case searchFeature = "SearchFeature"
    }
    
    enum Views {
        /// `Section Components`
        case buttons
        case carousels
        case textFieldWithLine
        
        /// `Section LoginFeature`
        case homeViewController
        case phoneViewController
        case verifyCodeViewController
        case additionalInformationViewController
        case recoveryPassViewController
        case exampleViewController
        
        /// `Section FeedFeature`
        case saveAddressViewController
        case listAddressSaveViewController
        
        /// `Section SearchFeature`
        
        
        var name: String {
            switch self {
            case .buttons:
                return "Buttons"
            case .carousels:
                return "Carousel Collection View"
            case .textFieldWithLine:
                return "TextField with line"
            case .homeViewController:
                return "HomeViewController"
            case .phoneViewController:
                return "PhoneViewController"
            case .verifyCodeViewController:
                return "VerifyCodeViewController"
            case .additionalInformationViewController:
                return "AdditionalInfoSignInViewController"
            case .recoveryPassViewController:
                return "RecoveryPassViewController"
            case .saveAddressViewController:
                return "SaveAddressViewController"
            case .listAddressSaveViewController:
                return "ListAddressSaveViewController"
            case .exampleViewController:
                return "ExampleViewController"
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .buttons:
                return DemoButtonsTableViewController()
            case .carousels:
                return ViewController()
            case .textFieldWithLine:
                return DemoTextFieldWithLineViewController()
            case .homeViewController:
                return HomeViewController()
            case .phoneViewController:
                return PhoneViewController()
            case .verifyCodeViewController:
                let viewController = VerifyCodeViewController()
                viewController.configure(with: "+525527149106", verificationId: "")
                return viewController
            case .additionalInformationViewController:
                return AdditionalInfoSignInViewController()
            case .recoveryPassViewController:
                return RecoveryPassViewController()
            case .saveAddressViewController:
                return SaveAddressViewController()
            case .listAddressSaveViewController:
                return ListAddressSaveViewController()
            case .exampleViewController:
                return ExampleViewController()
            }
        }
        
    }
    
    static let demoViews: [DemoView] =
    [
        (.components,
         [
            .buttons,
            .carousels,
            .textFieldWithLine
         ]
        ),
        (.loginFeatures,
         [
            .homeViewController,
            .phoneViewController,
            .verifyCodeViewController,
            .additionalInformationViewController,
            .recoveryPassViewController,
            .exampleViewController
         ]
        ),
        (.feedFeature, [
            .saveAddressViewController,
            .listAddressSaveViewController
        ]),
        (.searchFeature, []),
    ]
}
