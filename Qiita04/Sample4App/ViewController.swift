//
//  ViewController.swift
//  Sample4App
//
//  Created by Admin on 2021/02/10.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}

//typealias ShadowElevation = CGFloat
//
//private let MDCShadowElevationAppBar = CGFloat(4.0)
//
//class ShadowMetrics: NSObject {
//
//    private let kKeyShadowOpacity = Float(0.26)
//    private let kAmbientShadowOpacity = Float(0.08)
//
//    private(set) var topShadowRadius: CGFloat = 0.0
//    private(set) var topShadowOffset = CGSize.zero
//    private(set) var topShadowOpacity: Float = 0.0
//    private(set) var bottomShadowRadius: CGFloat = 0.0
//    private(set) var bottomShadowOffset = CGSize.zero
//    private(set) var bottomShadowOpacity: Float = 0.0
//
//
//
//    class func metricswithElevation(_ elevation: CGFloat) -> ShadowMetrics? {
//        if 0.0 < elevation {
//            return ShadowMetrics().initWithElevation(elevation)
//        } else {
//            return ShadowMetrics.emptyShadowMetrics()
//        }
//    }
//
//    func initWithElevation(_ elevation: CGFloat) -> ShadowMetrics? {
//        topShadowRadius = ShadowMetrics.ambientShadowBlur(elevation)
//        topShadowOffset = CGSize(width: 0.0, height: 0.0)
//        topShadowOpacity = kAmbientShadowOpacity
//        bottomShadowRadius = ShadowMetrics.keyShadowBlur(elevation)
//        bottomShadowOffset = CGSize(width: 0.0, height: ShadowMetrics.keyShadowYOff(elevation))
//        bottomShadowOpacity = kKeyShadowOpacity
//        return self
//    }
//
//    static let emptyShadowMetricsVar: ShadowMetrics? = {
//        var emptyShadowMetrics = ShadowMetrics()
//        emptyShadowMetrics.topShadowRadius = CGFloat(0.0)
//        emptyShadowMetrics.topShadowOffset = CGSize(width: 0.0, height: 0.0)
//        emptyShadowMetrics.topShadowOpacity = 0
//        emptyShadowMetrics.bottomShadowRadius = CGFloat(0.0)
//        emptyShadowMetrics.bottomShadowOffset = CGSize(width: 0.0, height: 0.0)
//        emptyShadowMetrics.bottomShadowOpacity = 0
//        return emptyShadowMetrics
//    }()
//
//    class func emptyShadowMetrics() -> ShadowMetrics? {
//        return emptyShadowMetricsVar
//    }
//
//    class func ambientShadowBlur(_ points: CGFloat) -> CGFloat {
//        let blur = CGFloat(0.889544) * points - CGFloat(0.003701)
//        return blur
//    }
//
//    class func keyShadowBlur(_ points: CGFloat) -> CGFloat {
//        let blur = CGFloat(0.666920) * points - CGFloat(0.001648)
//        return blur
//    }
//
//    class func keyShadowYOff(_ points: CGFloat) -> CGFloat {
//        let yOff = CGFloat(1.23118) * points - CGFloat(0.03933)
//        return yOff
//    }
//}
//
//class ShadowLayer: CALayer {
//
//    private var topShadow: CAShapeLayer?
//    private var bottomShadow: CAShapeLayer?
//    private var topShadowMask: CAShapeLayer?
//    private var bottomShadowMask: CAShapeLayer?
//
//    private var shadowPathIsInvalid = false
//
//    var elevation: ShadowElevation?
//    var shadowMaskEnabled = false
//
//    override init() {
//        super.init()
//
//        elevation = 0
//        shadowMaskEnabled = true
//        shadowPathIsInvalid = true
//
//        commonShadowLayerInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override init(layer: Any) {
//        super.init(layer: layer)
//
//        if layer is ShadowLayer {
//            let otherLayer = layer as? ShadowLayer
//            elevation = otherLayer?.elevation
//            shadowMaskEnabled = ((otherLayer?.shadowMaskEnabled) != nil)
//            if let _bottomShadow = otherLayer?.bottomShadow {
//                bottomShadow = CAShapeLayer(layer: _bottomShadow)
//            }
//            if let _topShadow = otherLayer?.topShadow {
//                topShadow = CAShapeLayer(layer: _topShadow)
//            }
//            if let _topShadowMask = otherLayer?.topShadowMask {
//                topShadowMask = CAShapeLayer(layer: _topShadowMask)
//            }
//            if let _bottomShadowMask = otherLayer?.bottomShadowMask {
//                bottomShadowMask = CAShapeLayer(layer: _bottomShadowMask)
//            }
//            commonShadowLayerInit()
//        }
//    }
//
//    func commonShadowLayerInit() {
//        if (bottomShadow == nil) {
//            bottomShadow = CAShapeLayer()
//            bottomShadow?.backgroundColor = UIColor.clear.cgColor
//            bottomShadow?.shadowColor = UIColor.black.cgColor
//            bottomShadow?.delegate = self
//            addSublayer(bottomShadow!)
//        }
//
//        if (topShadow == nil) {
//            topShadow = CAShapeLayer()
//            topShadow?.backgroundColor = UIColor.clear.cgColor
//            topShadow?.shadowColor = UIColor.black.cgColor
//            topShadow?.delegate = self
//            addSublayer(topShadow!)
//        }
//
//        let shadowMetrics = ShadowMetrics.metricswithElevation(elevation!)
//        topShadow!.shadowOffset = shadowMetrics!.topShadowOffset
//        topShadow!.shadowRadius = shadowMetrics!.topShadowRadius
//        topShadow!.shadowOpacity = shadowMetrics!.topShadowOpacity
//        bottomShadow!.shadowOffset = shadowMetrics!.bottomShadowOffset
//        bottomShadow!.shadowRadius = shadowMetrics!.bottomShadowRadius
//        bottomShadow!.shadowOpacity = shadowMetrics!.bottomShadowOpacity
//
//        if (topShadowMask == nil) {
//            topShadowMask = CAShapeLayer()
//            topShadowMask!.delegate = self
//        }
//        if (bottomShadowMask == nil) {
//            bottomShadowMask = CAShapeLayer()
//            bottomShadowMask!.delegate = self
//        }
//
//        if shadowMaskEnabled {
//            //configureShadowLayerMask(forLayer: topShadowMask)
//            //configureShadowLayerMask(forLayer: bottomShadowMask)
//            //topShadow.mask = topShadowMask
//            //bottomShadow.mask = bottomShadowMask
//        }
//    }
//
//    override func layoutSublayers() {
//        super.layoutSublayers()
//
//        prepareShadowPath()
//        //commonLayoutSublayers()
//    }
//
//    func setBounds(_ bounds: CGRect) {
//        let sizeChanged = !self.bounds.size.equalTo(bounds.size)
//        self.setBounds(bounds)
//        if sizeChanged {
//            shadowPathIsInvalid = true
//            setNeedsLayout()
//        }
//    }
//
//    func prepareShadowPath() {
//
//    }
//}
//
//extension ShadowLayer: CALayerDelegate {}
//
//class MDCButton: UIButton {
//
//    private let defaultCornerRadius: CGFloat = 2.0
//
//    convenience init() {
//        self.init(frame: .zero)
//
//
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func commonInit() {
//        self.layer.cornerRadius = defaultCornerRadius
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // ripple
//        print("touches began")
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touches ended")
//    }
//
//    func setEnabled(_ enabled: Bool) {
//        setEnabled(enabled, animated: false)
//    }
//
//    func setEnabled(_ enabled: Bool, animated: Bool) {
//        self.isEnabled = enabled
//
//        self.updateAfterStateChange(animated)
//    }
//
//    func setHighlighted(_ highlited: Bool) {
//        updateAfterStateChange(false)
//    }
//
//    func setSelected(_ selected: Bool) {
//        updateAfterStateChange(false)
//    }
//
//    func updateAfterStateChange(_ animated: Bool) {
//        // change color, border, shadow
//    }
//}
//
//class CustomButton: UIButton {
//
//    override var isHighlighted: Bool {
//        didSet {
//            let value: CGFloat = isHighlighted ? 0.97 : 1.0
//            let transform = CGAffineTransform(scaleX: value, y: value)
//            self.transform = transform
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//class ViewController: UIViewController {
//
//    let NextButton: CustomButton = {
//        let button = CustomButton(type: .custom)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .rgb(red: 46, green: 88, blue: 226)
//        button.setTitle("Button", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        button.layer.cornerRadius = 6
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 0, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.24
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//
//        view.addSubview(NextButton)
//
//        NextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        NextButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        NextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        NextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//}
//
//
//class CustomTabBar: UITabBar {
//
//    convenience init() {
//        self.init(frame: .zero)
//
//        commonInit()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func commonInit() {
//        backgroundColor = .white
//
//    }
//}

final class Bar: UIView {
    
    let barHeight:CGFloat = 48
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let width:CGFloat = UIScreen.main.bounds.width
        let height:CGFloat = UIScreen.main.bounds.height
        let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        
        let line1 = UIBezierPath()
        
        let center = CGPoint(x: width / 2, y: height - (barHeight + bottomInset))
        let radius: CGFloat = 35
        let startAngle: CGFloat = CGFloat(Double.pi) * 2 * 180 / 360
        let endAngle: CGFloat = CGFloat(Double.pi) * 2 * 360 / 360
        line1.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        line1.addLine(to: CGPoint(x: width, y: height - (barHeight + bottomInset)))
        line1.addLine(to: CGPoint(x: width, y: height))
        line1.addLine(to: CGPoint(x: 0, y: height))
        line1.addLine(to: CGPoint(x: 0, y: height - (barHeight + bottomInset)))
        
        line1.close()
        
        UIColor.white.setFill()
        line1.fill()
    }
}


class DrawView: UIView {
    
    let middleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .rgb(red: 86, green: 36, blue: 228)
        button.tintColor = .white
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        button.layer.cornerRadius = 56 / 2
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.layer.shadowRadius = 6
        button.layer.shadowOpacity = 0.26
        return button
    }()
    
    private let bar: Bar = {
        let b = Bar()
        b.layer.shadowColor = UIColor.black.cgColor
        b.layer.shadowOffset = CGSize(width: 0, height: 8)
        b.layer.shadowRadius = 8
        b.layer.shadowOpacity = 0.26
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        bar.frame = UIScreen.main.bounds
        addSubview(bar)
        
        let width:CGFloat = UIScreen.main.bounds.width
        let height:CGFloat = UIScreen.main.bounds.height
        let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        
        let middleButtonWidthHeight: CGFloat = 56
        let middleButtonRadius: CGFloat = middleButtonWidthHeight / 2
        
        let x: CGFloat = (width / 2) - middleButtonRadius
        let y: CGFloat = height - (bar.barHeight + bottomInset + middleButtonRadius)
        middleButton.frame = CGRect(x: x, y: y, width: middleButtonWidthHeight, height: middleButtonWidthHeight)
        
        addSubview(middleButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RootViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .rgb(red: 242, green: 246, blue: 254)
        
        let drawView = DrawView(frame: view.bounds)
        view.addSubview(drawView)
    }
}
