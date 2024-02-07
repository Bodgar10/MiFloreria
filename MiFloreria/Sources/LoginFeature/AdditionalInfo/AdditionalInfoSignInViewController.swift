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
    
    private let fullNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private let nameTextField: DSLineTF = {
        let view = DSLineTF()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let lastNameTextField: DSLineTF = {
        let view = DSLineTF()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
        configureTextFields()
        setupUI()
    }

    // MARK: Private functions
    
    private func configureTextFields() {
        nameTextField.configure(placeholder: "Nombre")
        lastNameTextField.configure(placeholder: "Apellido")
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(fullNameStackView)
        
        fullNameStackView.addArrangedSubview(nameTextField)
        fullNameStackView.addArrangedSubview(lastNameTextField)
        
        titleLabel
            .pin(.top, to: view.layoutMarginsGuide, spacing: .xLarge)
            .pin(.leading, to: view.layoutMarginsGuide, spacing: .medium)
            .pin(.trailing, to: view.layoutMarginsGuide, spacing: -.medium)
        
        fullNameStackView
            .pinSize(to: CGSize(width: 0, height: 50))
            .pin(.top, yAnchor: titleLabel.bottomAnchor, offset: 50)
            .pin(.trailing, to: view, spacing: -.xLarge)
            .pin(.leading, to: view, spacing: .xLarge)
    }
}
