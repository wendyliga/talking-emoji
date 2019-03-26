import UIKit

public class EmojiFace: UIView{
    
    public var mode: Mode = .normal{
        didSet{
            print("berubah")
        }
    }
    
    private lazy var anthennaStick: UIView = { [unowned self] in
        let anthenaStick = UIView(frame: CGRect(x: self.frame.width/2 - (7), y: 0, width: 10, height: 30))
        anthenaStick.backgroundColor = UIColor(red: 110/255, green: 91/255, blue: 135/255, alpha: 1)
        return anthenaStick
    }()
    
    private lazy var outter: UIView = { [unowned self] in
        let outter = UIView(frame: CGRect(x: (self.frame.width / 2) - ((self.frame.width * 0.9) / 2), y: (self.frame.height / 2) - ((self.frame.height * 0.9) / 2), width: self.frame.width * 0.9, height: self.frame.height * 0.9))
        outter.clipsToBounds = true
        outter.layer.cornerRadius = outter.frame.width * 0.2
        // create background gradient layer
        let outterGradientLayer = gradientLayer(firstColor: UIColor(red: 182/255, green: 199/255, blue: 193/255, alpha: 1), secondColor: UIColor(red: 19/255, green: 53/255, blue: 65/255, alpha: 1), frame: self.bounds)
        outter.layer.addSublayer(outterGradientLayer)
        
        return outter
    }()
    
    private lazy var inside: UIView = {[unowned self] in
        let inside = UIView(frame: CGRect(x: (self.frame.width / 2) - ((self.frame.width * 0.8) / 2), y: (self.frame.height / 2) - ((self.frame.height * 0.8) / 2), width: self.frame.width * 0.8, height: self.frame.height * 0.8))
        inside.clipsToBounds = true
        inside.layer.cornerRadius = inside.frame.width * 0.2
        // create background gradient layer
        let insideGradientLayer = gradientLayer(firstColor: UIColor(red: 223/255, green: 242/255, blue: 244/255, alpha: 1), secondColor: UIColor(red: 65/255, green: 126/255, blue: 140/255, alpha: 1), frame: self.bounds)
        inside.layer.addSublayer(insideGradientLayer)
        
        return inside
    }()
    
    private lazy var leftEyeOutter: UIView = {[unowned self] in
        let leftEyeOutline = UIView(frame: CGRect(x: self.frame.width * 0.15, y: self.frame.height * 0.2, width: self.frame.width * 0.25, height: self.frame.width * 0.25))
        leftEyeOutline.backgroundColor = UIColor.clear
        leftEyeOutline.clipsToBounds = true
        leftEyeOutline.layer.cornerRadius = self.frame.width * 0.25 / 2
        // add gradient color
        let leftEyeGradient = gradientLayer(firstColor: UIColor(red: 114/255, green: 246/255, blue: 252/255, alpha: 1), secondColor: UIColor(red: 72/255, green: 131/255, blue: 155/255, alpha: 1), frame: leftEyeOutline.bounds)
        leftEyeOutline.layer.addSublayer(leftEyeGradient)
    
        return leftEyeOutline
    }()
    
    private lazy var leftEye: UIView = {[unowned self] in
        let leftEye = UIView(frame: CGRect(x: self.frame.width * 0.2, y: self.frame.height * 0.2, width: self.frame.width * 0.2, height: self.frame.width * 0.2))
        leftEye.center = self.leftEyeOutter.center
        leftEye.backgroundColor = UIColor.white
        leftEye.layer.cornerRadius = self.frame.width * 0.2 / 2
        return leftEye
    }()
    
    private lazy var rightEyeOutter: UIView = {[unowned self] in
        let rightEyeOutline = UIView(frame: CGRect(x: self.frame.width * 0.6, y: self.frame.height * 0.2, width: self.frame.width * 0.25, height: self.frame.width * 0.25))
        rightEyeOutline.backgroundColor = UIColor.blue
        rightEyeOutline.clipsToBounds = true
        rightEyeOutline.layer.cornerRadius = self.frame.width * 0.25 / 2
        
        // add gradient color
        let rightEyeGradient = gradientLayer(firstColor: UIColor(red: 114/255, green: 246/255, blue: 252/255, alpha: 1), secondColor: UIColor(red: 72/255, green: 131/255, blue: 155/255, alpha: 1), frame: rightEyeOutline.bounds)
        rightEyeOutline.layer.addSublayer(rightEyeGradient)
        
        return rightEyeOutline
    }()
    
    private lazy var rightEye: UIView = {[unowned self] in
        let rightEye = UIView(frame: CGRect(x: self.frame.width * 0.6, y: self.frame.height * 0.2, width: self.frame.width * 0.2, height: self.frame.width * 0.2))
        rightEye.center = self.rightEyeOutter.center
        rightEye.backgroundColor = UIColor.white
        rightEye.layer.cornerRadius = self.frame.width * 0.2 / 2
        
        return rightEye
    }()
    
    private lazy var nose: UIView = {[unowned self] in
        let nose = TriangleView(frame: CGRect(x: self.frame.width / 2 - 12.5, y: rightEyeOutter.frame.height + 15, width: 25, height: 27))
        
        self.addSubview(nose)
        return nose
    }()
    
    private lazy var leftEar: UIView = {[unowned self] in
        let leftEar = UIView(frame: CGRect(x: 0, y: self.frame.height/2 - ((self.frame.height * 0.3)/2), width: self.frame.width * 0.05, height: self.frame.height * 0.3))
        leftEar.backgroundColor = UIColor.red
        leftEar.layer.cornerRadius = 5
        
        return leftEar
    }()
    
    private lazy var rightEar: UIView = {[unowned self] in
        let rightEar = UIView(frame: CGRect(x: outter.frame.maxX, y: self.frame.height/2 - ((self.frame.height * 0.3)/2), width: self.frame.width * 0.05, height: self.frame.height * 0.3))
        rightEar.backgroundColor = UIColor.red
        rightEar.layer.cornerRadius = 5
        
        return rightEar
    }()
    
    private lazy var mouth: UIView = {[unowned self] in
        let mouth = UIView(frame: CGRect(x: self.frame.width/2 - ((self.frame.width * 0.45)/2), y: nose.frame.maxY + 20, width: self.frame.width * 0.45, height: self.frame.height * 0.1))
        mouth.translatesAutoresizingMaskIntoConstraints = false
        mouth.clipsToBounds = true
        mouth.layer.borderColor = UIColor.black.cgColor
        mouth.layer.borderWidth = 2
        mouth.layer.cornerRadius = mouth.frame.width * 0.07
        mouth.backgroundColor = UIColor.white
        
        for i in 1..<4{
            let tooth = UIView(frame: CGRect(x: (self.frame.width * 0.45 / 4 * CGFloat(i)) - (5/2), y: 0, width: 5, height: self.frame.height * 0.1))
            tooth.backgroundColor = UIColor.black
            mouth.addSubview(tooth)
        }
        
        return mouth
    }()
    
    private lazy var mouthTopConstraint: NSLayoutConstraint = {[unowned self] in
        return mouth.topAnchor.constraint(equalTo: self.nose.bottomAnchor, constant: 20)
    }()
    
    private lazy var mouthCenterXConstraint: NSLayoutConstraint = {[unowned self] in
        return self.mouth.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0)
    }()
    
    private lazy var mouthWidthConstraint: NSLayoutConstraint = {[unowned self] in
        return self.mouth.widthAnchor.constraint(equalToConstant: self.frame.width * 0.45)
    }()
    
    private lazy var mouthHeightConstraint: NSLayoutConstraint = {[unowned self] in
        return self.mouth.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1)
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.clear
        // set clip to bound true to prevent gradient layer to go out of bounds
        self.clipsToBounds = true
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = self.frame.width * 0.2

        
        self.addSubview(anthennaStick)
        self.addSubview(outter)
        self.addSubview(inside)
        self.addSubview(leftEyeOutter)
        self.addSubview(leftEye)
        self.addSubview(rightEyeOutter)
        self.addSubview(rightEye)
        self.addSubview(mouth)
        self.addSubview(leftEar)
        self.addSubview(rightEar)
        
        NSLayoutConstraint.activate([
            mouthTopConstraint,
            mouthCenterXConstraint,
            mouthWidthConstraint,
            mouthHeightConstraint
        ])
        
    }
    
    func gradientLayer(firstColor: UIColor, secondColor: UIColor, frame: CGRect) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        
        let gradientPoint: (CGPoint,CGPoint) = (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
        
        gradientLayer.startPoint = gradientPoint.0
        gradientLayer.endPoint = gradientPoint.1
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = frame
        
        return gradientLayer
    }
    
    public func speak(text: String){
        let splittedString = text.components(separatedBy: " ")
        
        UIView.animateKeyframes(withDuration: 0.26 * Double(splittedString.count), delay: 0, options: .calculationModeCubic, animations: {
            let relativeDuration = Double((Double(1.0)/Double(splittedString.count)))
            for (index,text) in splittedString.enumerated(){
                UIView.addKeyframe(withRelativeStartTime: relativeDuration * Double(index), relativeDuration: relativeDuration) {
                    self.mouthWidthConstraint.constant = (self.frame.width * 0.45) / CGFloat(text.count)
                    self.layoutIfNeeded()
                }
            }
        }) { (true) in
            self.mouthWidthConstraint.constant = (self.frame.width * 0.45)
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutIfNeeded()
            })
        }
    }
}

class TriangleView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
         let path = UIBezierPath()
         path.lineWidth = 3
        
         path.move(to: CGPoint(x: rect.width/2, y: 0))
         path.addLine(to: CGPoint(x: rect.width, y: rect.height))
         path.addLine(to: CGPoint(x: 0, y: rect.height))
         path.close()
    
         UIColor(red: 189/255, green: 106/255, blue: 102/255, alpha: 1).setFill()
         path.fill()
        
         UIColor(red: 255/255, green: 62/255, blue: 50/255, alpha: 1).setStroke()
         path.stroke()
    
    }
}

public enum Mode{
    case normal
    case wink
    case cry
}
