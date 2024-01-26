//
//  SecondaryButtonTableViewCell.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 23/01/24.
//

import UIKit
import ProjectUI

class SecondaryButtonTableViewCell: UITableViewCell {

    public let secondaryButton: DSButton = {
        let button = DSButton(style: .secondary)
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
        let yourAttributes: [NSAttributedString.Key: Any] = [
             .font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.dsPrimary,
             .underlineStyle: NSUnderlineStyle.single.rawValue
         ]
        
        let attributeString = NSMutableAttributedString(
                string: title,
                attributes: yourAttributes
        )
        secondaryButton.setAttributedTitle(attributeString, for: .normal)
    }
    
    private func setupUI() {
        contentView.addSubview(secondaryButton)
        secondaryButton
            .pinCenter(to: contentView)
            .pinSize(to: CGSize(width: 150, height: 40))
    }

}
