//
//  AdditionalInfoSignInViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 01/02/24.
//

import UIKit
import ProjectUI

final class AdditionalInfoSignInViewController: UIViewController {

    // MARK: Private Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Información adicional"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "DSBackground")
    }

}
