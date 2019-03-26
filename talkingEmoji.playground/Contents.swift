//: A UIKit based Playground for presenting user interface
import AVFoundation
import UIKit
import PlaygroundSupport

class TitleViewController : UIViewController {
    // MARK: - Variable
    private lazy var parentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 20/255, green: 26/255, blue: 47/255, alpha: 1)
        return view
    }()
    
    /// create title
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Talking Emoji"
        label.textColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 35)
        
        return label
    }()
    
    /// create emoji face
    private lazy var emojiFace: EmojiFace = {
        let emojiFace = EmojiFace(frame: CGRect.zero)
        emojiFace.translatesAutoresizingMaskIntoConstraints = false
        return emojiFace
    }()
    
    /// create textfield for input text
    private lazy var textField: UITextField = {[unowned self] in
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.text = "I love Apple"
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    }()
    
    /// create button start
    private lazy var buttonStart: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Speak", for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 0.3), for: .highlighted)
        button.backgroundColor = UIColor.clear
        
        button.layer.borderColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onStart))
        button.addGestureRecognizer(tap)
        
        return button
    }()
    
    private lazy var modeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Emoji Expression"
        label.textAlignment = .right
        label.textColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.isHidden = true
        
        return label
    }()
    
    /// create button normal
    private lazy var normalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Normal", for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 0.3), for: .highlighted)
        button.backgroundColor = UIColor.clear
        button.isHidden = true
        
        button.layer.borderColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(normal))
        button.addGestureRecognizer(tap)
        
        return button
    }()
    
    /// create button wink
    private lazy var winkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Wink", for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 0.3), for: .highlighted)
        button.backgroundColor = UIColor.clear
        button.isHidden = true
        
        button.layer.borderColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(wink))
        button.addGestureRecognizer(tap)
        
        return button
    }()
    
    /// create button wink
    private lazy var cryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cry", for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 0.3), for: .highlighted)
        button.backgroundColor = UIColor.clear
        button.isHidden = true
        
        button.layer.borderColor = UIColor(red: 136/255, green: 135/255, blue: 139/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cry))
        button.addGestureRecognizer(tap)
        
        return button
    }()
    
    // MARK: - LifeCycle
    override func loadView() {
        self.view = parentView
        view.addSubview(titleLabel)
        view.addSubview(buttonStart)
        view.addSubview(emojiFace)
        view.addSubview(textField)
        view.addSubview(winkButton)
        view.addSubview(cryButton)
        view.addSubview(normalButton)
        view.addSubview(modeLabel)
        
        // set autolayout
        NSLayoutConstraint.activate([
            // title auto layout
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            // emoji face auto layout
            emojiFace.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            emojiFace.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 100),
            emojiFace.widthAnchor.constraint(equalToConstant: 150),
            emojiFace.heightAnchor.constraint(equalToConstant: 150),
            
            // textfield's auto layout
            textField.topAnchor.constraint(equalTo: emojiFace.bottomAnchor, constant: 50),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textField.widthAnchor.constraint(equalToConstant: 250),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            // button auto layout
            buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonStart.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25),
            buttonStart.widthAnchor.constraint(equalToConstant: 100),
            buttonStart.heightAnchor.constraint(equalToConstant: 35),
            
            // button auto layout
            modeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            modeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            //modeLabel.widthAnchor.constraint(equalToConstant: 100),
            //modeLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // button auto layout
            normalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            normalButton.topAnchor.constraint(equalTo: modeLabel.bottomAnchor, constant: 25),
            normalButton.widthAnchor.constraint(equalToConstant: 100),
            normalButton.heightAnchor.constraint(equalToConstant: 35),
            
            
            // button auto layout
            winkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            winkButton.topAnchor.constraint(equalTo: normalButton.bottomAnchor, constant: 25),
            winkButton.widthAnchor.constraint(equalToConstant: 100),
            winkButton.heightAnchor.constraint(equalToConstant: 35),
            
            // button auto layout
            cryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            cryButton.topAnchor.constraint(equalTo: winkButton.bottomAnchor, constant: 25),
            cryButton.widthAnchor.constraint(equalToConstant: 100),
            cryButton.heightAnchor.constraint(equalToConstant: 35),
    
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
    }
    
    // MARK: - Function
    @objc private func onStart(){
        guard let string = textField.text else {return}
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    
        emojiFace.speak(text: string)
    }
    
    @objc private func normal(){
        emojiFace.mode = .normal
    }
    @objc private func wink(){
        emojiFace.mode = .wink
    }
    @objc private func cry(){
        emojiFace.mode = .cry
    }
    
    @objc private func dismissKeyboard(){
        self.textField.endEditing(true)
    }
}

extension TitleViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}

let vc = TitleViewController()
vc.preferredContentSize = UIScreen.main.bounds.size
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
