//
//  RootViewController.swift
//  SampleApp3
//
//  Created by Admin on 2021/02/10.
//

import UIKit

class RootViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGreen
        self.title = "Test"
        
        if #available(iOS 11.0, *) {
            let navBarHeight: CGFloat = 100 - 44
            additionalSafeAreaInsets.top = navBarHeight
        }
        
        self.view.addSubview(topView)
        
        topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        topView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
