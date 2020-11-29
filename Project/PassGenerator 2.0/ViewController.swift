//
//  ViewController.swift
//  PassGenerator 2.0
//
//  Created by The Developer
//
import Lottie
import UIKit

class ViewController: UIViewController {
    
    var animationView = AnimationView()
    var all = ["a","b","c","d","e","f","g",
               "h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"]
    
    override func viewDidLoad() {
        animationView.isHidden = true
        Copybutton.sendSubviewToBack(view)
        view.addSubview(label)
        view.addSubview(maskedlabel)
        view.addSubview(Copybutton)
        view.addSubview(eye)
        eye.addTarget(self, action: #selector(eyeChanger), for: .touchUpInside)
        Copybutton.addTarget(self, action: #selector(copy2), for: .touchUpInside)
        while label.text!.count <= 7 {
            label.text!.append(all.randomElement() ?? "")
    
            
            
        }
        print(label.text!.count)
        print(label.text)
    }

        
       
    private var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.frame = CGRect(x: 130, y: 200, width: 250, height: 60)
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "ArialMT", size: 28)
        label.isHidden = true
        return label
    }()
    
    private var maskedlabel: UILabel = {
        let label = UILabel()
        label.text = "********"
        label.frame = CGRect(x: 120, y: 208, width: 250, height: 60)
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "ArialMT", size: 45)
        return label
    }()
    
    private var Copybutton: UIButton = {
        let button = UIButton()
        button.setTitle("Copy", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 120, y: 260, width: 185, height: 50)
        
        return button
    }()
    
    private var eye: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Show"), for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 270, y: 215, width: 40, height: 30)
        
        return button
    }()
    
@objc func copy2() {
    UIPasteboard.general.string = label.text
    setupAnimation()
    animationView.isHidden = false
    Copybutton.setTitle("", for: .normal)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.25 ){
        self.animationView.isHidden = true
        self.Copybutton.setTitle("Copy", for: .normal)
    }


}
    
    @objc func eyeChanger() {
        if eye.currentBackgroundImage == UIImage(named: "Show") {
            eye.setBackgroundImage(UIImage(named: "Hide"), for: .normal)
            label.isHidden = false
            maskedlabel.isHidden = true
        }
        else if eye.currentBackgroundImage == UIImage(named: "Hide") {
            eye.setBackgroundImage(UIImage(named: "Show"), for: .normal)
            label.isHidden = true
            maskedlabel.isHidden = false
        }
    }

private func setupAnimation() {
    animationView.animation = Animation.named("animation")
    animationView.backgroundColor = .link
    animationView.loopMode = .repeatBackwards(1)
    animationView.frame = CGRect (x: 165, y: 260, width: 93, height: 50)
    animationView.play()
    animationView.layer.cornerRadius = 12
    view.addSubview(animationView)
    
}

}
