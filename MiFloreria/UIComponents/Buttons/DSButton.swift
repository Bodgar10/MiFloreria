//
//  DSButton.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 23/01/24.
//

import UIKit
import ProjectUI

final class DSButton: UIButton {
    enum ButtonStyle {
        case primary
        case secondary
    }
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        configureButton(with: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton(with style: ButtonStyle) {
        switch style {
        case .primary:
            configurePrimaryButton()
        case .secondary:
            configureSecondaryButton()
        }
    }
    
    private func configurePrimaryButton() {
        backgroundColor = UIColor.dsPrimary
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 5
    }
    
    private func configureSecondaryButton() {
        backgroundColor = .clear
        setTitleColor(.dsPrimary, for: .normal)
    }
}
