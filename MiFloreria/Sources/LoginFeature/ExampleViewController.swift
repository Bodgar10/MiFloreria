//
//  ExampleViewController.swift
//  MiFloreria
//
//  Created by Bodgar Espinosa Miranda on 25/04/24.
//

import UIKit
import ProjectUI

class ExampleViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "LABEL DE PRUEBA"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "vmsfdovndob neboinerboinerboiesnbsenbioernbreionbñesobnrseñornbesñobneñsonbeñoinbeñoibneñnbeñonbe"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.background
        view.addSubview(label)
        view.addSubview(label2)
        
        label
            .pin(.top, to: view.safeAreaLayoutGuide, spacing: .xLarge)
            .pin(.centerX, to: view)
        
        label2
            .pin(.top, yAnchor: label.bottomAnchor, spacing: .xLarge)
            .pin(.leading, to: view, spacing: .medium)
            .pin(.trailing, to: view, spacing: -.medium)
    }

}
