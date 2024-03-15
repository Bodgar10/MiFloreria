//
//  EnterMethodNumPayViewController.swift
//  MiFloreria
//
//  Created by Johnne Lemand on 15/02/24.
//
import Combine
import UIKit
import ProjectUI

final class RecoveryPassViewController: MainViewController {

    private var cancellables: Set<AnyCancellable> = []

    private var topTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrar"
        label.font = .systemFont(ofSize: 27, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private var methodPayLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Por favor, ingresa tu contraseña"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private let nextButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Siguiente", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var passStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = . horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()

    private var containPassLabelStackView : UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = . horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 3
        return stack
    }()

    private var passLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contraseña"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private var passTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true
        return text
    }()

    private var lineBaseView : UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.tintColor = .black
        return button
    }()

    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.small.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = stackView.heightAnchor.constraint(equalToConstant: 110)
        heightConstraint.isActive = true
        let widthConstraint = stackView.widthAnchor.constraint(equalToConstant: 180)
        widthConstraint.isActive = true
        return stackView
    }()

    private let registerButton: UIButton = {
        let button = DSButton(style: .secondary)
        button.setTitle(with: "contraseña")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    private lazy var registerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
        }()


    private let registerLabelWithButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: "Recuperar ")
        let buttonTitle = NSAttributedString(string: "contraseña", attributes: [.foregroundColor: DesignSystem.primary ?? "", .underlineStyle: NSUnderlineStyle.single.rawValue])
        attributedString.append(buttonTitle)
        label.attributedText = attributedString
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: RecoveryPassViewController.self, action: #selector(recuperarTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()


    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
        showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
#if DEV
        setupBinding()
#endif
    }
    // MARK: Private functions

#if DEV
    private func setupBinding() {
        nextButton.didTap.sink { _ in
            // TODO: Send to the next view of the additional info
        }
        .store(in: &cancellables)

//        resendButton.didTap.sink { _ in
//            // TODO: Execute again the service for the authentication with phone
//        }
    }
#endif

    override func setupUI() {
        view.addSubview(topTitleLabel)
        view.addSubview(methodPayLabel)
        view.addSubview(passStackView)
        view.addSubview(lineBaseView)
        view.addSubview(nextButton)
        view.addSubview(registerStackView)
        view.addSubview(containPassLabelStackView)


        registerStackView.addArrangedSubview(registerLabelWithButton)


        passStackView.addArrangedSubview(passTextField)
        passStackView.addArrangedSubview(showPasswordButton)

        containPassLabelStackView.addArrangedSubview(passLabel)

        showPasswordButton
            .pinSize(to: 25)
            .pin(.trailing, to: passStackView, constant: 20)

        topTitleLabel
            .pin(.top, to: view.safeAreaLayoutGuide, constant: 20)
            .pin(.centerX, to: view.centerXAnchor)

        methodPayLabel
            .pin(.top, yAnchor: topTitleLabel.bottomAnchor, spacing: .large)
            .pin(.leading, to: view.safeAreaLayoutGuide, spacing: .large)
            .pin(.trailing, to: view.safeAreaLayoutGuide, spacing: -.large)

        containPassLabelStackView
            .pin(.top, yAnchor: methodPayLabel.bottomAnchor, spacing: .medium)
            .pin(.leading, to: view , constant: 25)
            .pin(.trailing, to: view, constant: -25)
            .pinSize(to: 25)

        passStackView
            .pin(.top, yAnchor: containPassLabelStackView.bottomAnchor, spacing: .zero)
            .pin(.leading, to: view , constant: 25)
            .pin(.trailing, to: view, constant: -25)
            .pinSize(to: 25)

        lineBaseView
            .pin(.top, yAnchor: passStackView.bottomAnchor, spacing: .small)
            .pin(.leading, to: view, constant: 20)
            .pin(.trailing, to: view, constant: -20)
            .pinSize(to: 1)

        nextButton
            .pin(.top, yAnchor: lineBaseView.bottomAnchor, spacing: .medium)
            .pin(.centerX, to: view)
            .pinSize(to: CGSize(width: 180, height: 45))


        registerStackView
        .pin(.top, yAnchor: nextButton.bottomAnchor, spacing: .large)
        .pin(.leading, to: view.safeAreaLayoutGuide, spacing: .zero)
        .pin(.trailing, to: view.safeAreaLayoutGuide, spacing: -.zero)

    }

    // MARK: TOUCH BUTTON EYE VISIBILITY "PASS"
    @objc private func togglePasswordVisibility() {
        passTextField.isSecureTextEntry.toggle()
    }

    @objc private func recuperarTapped() {

    }

}
