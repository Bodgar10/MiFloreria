//
//  HomeViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 25/01/24.
//

import Combine
import UIKit
import ProjectUI

class HomeViewController: MainViewController {

    // MARK: Private variables
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: UI Components
    
    private let logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Spacing.large.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.small.rawValue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.text = "¡Regala una sonrisa hoy!"
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        
        let text = "Manda flores a donde quieras, las llevaremos en menos de 90 minutos."
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "menos de 90 minutos.")
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        
        label.attributedText = attributedString
        return label
    }()
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Envíos las 24 horas del día."
        return label
    }()
    
    private let logInButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Entrar", for: .normal)
        return button
    }()
    
    private let signInButton: DSButton = {
        let button = DSButton(style: .primary)
        button.setTitle("Registrarse", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
#if DEV
        setupBinding()
#endif
    }
    
    // MARK: Private functions
    
#if DEV
    private func setupBinding() {
        logInButton.didTap.sink { [weak self] in
            let phoneController = PhoneViewController()
            phoneController.configure(with: "Entrar")
            self?.navigationController?.pushViewController(phoneController, animated: true)
        }
        .store(in: &cancellables)
        
        signInButton.didTap.sink { [weak self] in
            let phoneController = PhoneViewController()
            self?.navigationController?.pushViewController(phoneController, animated: true)
        }
        .store(in: &cancellables)
    }
#endif
    
    override func setupUI() {
        view.addSubview(logoImage)
        view.addSubview(mainStackView)
        
        buttonsStackView.addArrangedSubview(logInButton)
        buttonsStackView.addArrangedSubview(signInButton)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(subtitleLabel)
        mainStackView.addArrangedSubview(deliveryLabel)
        mainStackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.pinSize(to: CGSize(width: mainStackView.frame.width, height: 45))
        
        logoImage
            .pin(.top, to: view.safeAreaLayoutGuide, constant: 16)
            .pin(.trailing, to: view, constant: -120)
            .pin(.leading, to: view, constant: 120)
        
        mainStackView
            .pin(.top, yAnchor: logoImage.bottomAnchor, spacing: .xLarge)
            .pin(.trailing, to: view, spacing: -.xLarge)
            .pin(.leading, to: view, spacing: .xLarge)
    }

}
