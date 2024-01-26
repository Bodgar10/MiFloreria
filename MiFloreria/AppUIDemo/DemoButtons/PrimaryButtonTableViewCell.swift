//
//  PrimaryButtonTableViewCell.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 23/01/24.
//

import UIKit
import ProjectUI

class PrimaryButtonTableViewCell: UITableViewCell {

    public let primaryButton: DSButton = {
        let button = DSButton(style: .primary)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(title: String) {
        primaryButton.setTitle(title, for: .normal)
    }
    
    private func setupUI() {
        contentView.addSubview(primaryButton)
        primaryButton
            .pinCenter(to: contentView)
            .pinSize(to: CGSize(width: 150, height: 40))
    }
}
