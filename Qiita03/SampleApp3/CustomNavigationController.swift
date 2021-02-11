//
//  CustomNavigationController.swift
//  SampleApp3
//
//  Created by Admin on 2021/02/10.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    // 1. イニシャライザ
        override init(rootViewController: UIViewController) {
            super.init(rootViewController: rootViewController)
        }
        
        // 2. イニシャライザ
        override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
            super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        }
        
        // 3. イニシャライザ
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        }

        // 4. 必須イニシャライザ
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // 5. 簡易イニシャライザ (1. 2. をまとめ便利にしたもの)
        convenience init(rootViewController:UIViewController , navigationBarClass:AnyClass?, toolbarClass: AnyClass?){
            self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
            self.viewControllers = [rootViewController]
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // 他にすることがある場合
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}


class CustomNavigationBar: UINavigationBar {
    
    private let barHeight: CGFloat = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.barTintColor = .white
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        
        var newSize = super.sizeThatFits(size)
        
        // iPhone X
        var topInset: CGFloat = 0
        if #available(iOS 11.0, *) {
            topInset = superview?.safeAreaInsets.top ?? 0
        }
        
        newSize.height = barHeight + topInset
        
        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 11.0, *) {
            for subview in subviews {
                let stringFromClass = NSStringFromClass(subview.classForCoder)
                
                // Adjust the height of the bar
                if stringFromClass.contains("UIBarBackground") {
                    let topInset: CGFloat = superview?.safeAreaInsets.top ?? 0
                    subview.frame = CGRect(origin: CGPoint(x: 0, y: -topInset), size: sizeThatFits(self.bounds.size))
                }
                
                // Set the position of the subview
                if stringFromClass.contains("UINavigationBarContentView") {
                    let y = (barHeight - subview.frame.height)
                    subview.frame.origin.y = y
                }
            }
        }
    }
}

