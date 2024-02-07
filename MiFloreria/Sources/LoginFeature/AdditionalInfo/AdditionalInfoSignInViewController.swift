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
    
    private let signInButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Registrarse", for: .normal)
        return button
    }()
    
    private let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Al registrarse, confirmas que aceptas nuestras condiciones de uso y nuestra política de publicidad."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
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
        view.addSubview(signInButton)
        view.addSubview(disclaimerLabel)
        
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
        
        signInButton
            .pin(.centerX, to: view.centerXAnchor)
            .pinSize(to: CGSize(width: 200, height: 50))
            .pin(.top, yAnchor: mainStackView.bottomAnchor, spacing: .xLarge)
        
        disclaimerLabel
            .pin(.top, yAnchor: signInButton.bottomAnchor, spacing: .xLarge)
            .pin(.trailing, to: view, spacing: -.medium)
            .pin(.leading, to: view, spacing: .medium)
    }
}
