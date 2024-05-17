//
//  VCPreview.swift
//  MiFloreria
//
//  Created by Jose David Torres Perez on 05/05/24.
//

import SwiftUI

struct VCPreview<T:UIViewController>: UIViewControllerRepresentable {
    
    let viewController: T
    
    init(_ viewControllerBuilder :  @escaping() -> T) {
        self.viewController = viewControllerBuilder()
    }
    func makeUIViewController(context: Context) -> T {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) { }
}
