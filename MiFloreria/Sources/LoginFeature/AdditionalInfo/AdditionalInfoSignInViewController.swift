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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Información adicional"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
        setupUI()
    }

    // MARK: Private functions
    
    private func setupUI() {
        view.addSubview(titleLabel)
        
        titleLabel
            .pin(.top, to: view.layoutMarginsGuide, spacing: .xLarge)
            .pin(.leading, to: view.layoutMarginsGuide, spacing: .medium)
            .pin(.trailing, to: view.layoutMarginsGuide, spacing: -.medium)
    }
}
