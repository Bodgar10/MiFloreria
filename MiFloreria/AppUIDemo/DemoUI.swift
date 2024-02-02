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
        
        /// `Section LoginFeature`
        case homeViewController
        case phoneViewController
        case verifyCodeViewController
        
        /// `Section FeedFeature`

        
        /// `Section SearchFeature`
        
        
        var name: String {
            switch self {
            case .buttons:
                return "Buttons"
            case .carousels:
                return "Carousel Collection View"
            case .homeViewController:
                return "HomeViewController"
            case .phoneViewController:
                return "PhoneViewController"
            case .verifyCodeViewController:
                return "VerifyCodeViewController"
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .buttons:
                return DemoButtonsTableViewController()
            case .carousels:
                return ViewController()
            case .homeViewController:
                return HomeViewController()
            case .phoneViewController:
                return PhoneViewController()
            case .verifyCodeViewController:
                return ViewController()
            }
        }
        
    }
    
    static let demoViews: [DemoView] =
    [
        (.components,
         [
            .buttons,
            .carousels
         ]
        ),
        (.loginFeatures,
         [
            .homeViewController,
            .phoneViewController,
            .verifyCodeViewController
         ]
        ),
        (.feedFeature, []),
        (.searchFeature, []),
    ]
}
