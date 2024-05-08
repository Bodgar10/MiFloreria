//
//  TextFieldWithLineViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 01/02/24.
//

import UIKit
import ProjectUI

class DemoTextFieldWithLineViewController: UIViewController {

    var textFieldWithLine: DSLineTF = {
        let view = DSLineTF()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(textFieldWithLine)
        
        textFieldWithLine
            .pinCenter(to: view)
            .pin(.leading, to: view, spacing: .xLarge)
            .pin(.trailing, to: view, spacing: -.xLarge)
        
        textFieldWithLine.configure(placeholder: "Nombre")
    }

}
