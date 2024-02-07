//
//  AdditionalInfoSignInViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 01/02/24.
//

import UIKit
import ProjectUI

final class AdditionalInfoSignInViewController: MainViewController {

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
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
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
    
    private let emailTextField: DSLineTF = {
        let view = DSLineTF()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let passwordTextField: DSLineTF = {
        let view = DSLineTF()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let confirmPasswordTextField: DSLineTF = {
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
    }

    // MARK: Private functions
    
    private func configureTextFields() {
        nameTextField.configure(placeholder: "Nombre")
        lastNameTextField.configure(placeholder: "Apellido")
        emailTextField.configure(placeholder: "Correo electrónico", keyboardType: .emailAddress)
        passwordTextField.configure(placeholder: "Contraseña", needsSecurity: true)
        confirmPasswordTextField.configure(placeholder: "Confirmar contraseña", needsSecurity: true)
    }
    
    override func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(fullNameStackView)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(confirmPasswordTextField)
        
        fullNameStackView.addArrangedSubview(nameTextField)
        fullNameStackView.addArrangedSubview(lastNameTextField)
        
        titleLabel
            .pin(.top, to: view.layoutMarginsGuide, spacing: .xLarge)
            .pin(.leading, to: view.layoutMarginsGuide, spacing: .medium)
            .pin(.trailing, to: view.layoutMarginsGuide, spacing: -.medium)
        
        mainStackView
            .pinSize(to: CGSize(width: 0, height: view.frame.height * 0.30))
            .pin(.top, yAnchor: titleLabel.bottomAnchor, offset: 50)
            .pin(.trailing, to: view, spacing: -.xLarge)
            .pin(.leading, to: view, spacing: .xLarge)
    }
}
