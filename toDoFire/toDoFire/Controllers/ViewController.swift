//
//  ViewController.swift
//  toDoFire
//
//  Created by Nochnoy Anton on 18/03/2019.
//  Copyright © 2019 Nochnoy Anton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.
        self.view.addCenterHorizontal(for: [lblDicrip, lblNotify, textFieldEmail, textFieldPassword, btnLogin, btnRegister])
        
        lblDicrip.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        lblNotify.topAnchor.constraint(equalTo: lblDicrip.bottomAnchor, constant: 40).isActive = true
        textFieldEmail.topAnchor.constraint(equalTo: lblNotify.bottomAnchor, constant: 150).isActive = true
        textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20).isActive = true
        btnLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 40).isActive = true
        btnRegister.topAnchor.constraint(equalTo: btnLogin.bottomAnchor, constant: 20).isActive = true
        
        
        self.view.backgroundColor = UIColor(red: 0, green: 0.7255, blue: 0.949, alpha: 1.0)
        
        lblDicrip.text = "ToDoFIRE"
        lblDicrip.font = lblDicrip.font.withSize(40)
        lblDicrip.textColor = .white
        
        lblNotify.text = "User does not exist"
        lblNotify.font = lblDicrip.font.withSize(15)
        lblNotify.textColor = .red
        
        textFieldEmail.createCustom(text: "Email")
        textFieldPassword.createCustom(text: "Password")
        textFieldPassword.isSecureTextEntry = true
        
        btnLogin.createCustom(title: "Login", font: UIFont.systemFont(ofSize: 30), color: UIColor(red: 0, green: 0.1, blue: 0.949, alpha: 0.1))
        btnRegister.createCustom(title: "Register", font: UIFont.systemFont(ofSize: 15), color: UIColor(red: 0, green: 0.1, blue: 0.949, alpha: 0.1))
        
        btnLogin.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    let lblDicrip = UILabel(frame: .zero)
    let lblNotify = UILabel(frame: .zero)
    
    let textFieldEmail = UITextField(frame: .zero)
    let textFieldPassword = UITextField()
    
    let btnLogin = UIButton()
    let btnRegister = UIButton()
    
    @objc func loginClicked(_ sender: UIButton) {
        let navigatController = UINavigationController(rootViewController: TasksViewController())
        navigationController?.navigationBar.backgroundColor = .white
        self.present(navigatController, animated: true, completion: nil)
    }
}

extension UIView {
    func addCenterHorizontal(for views: [UIView]) {
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
}

extension UITextField {
    func createCustom(text: String) {
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
        self.autocorrectionType = UITextAutocorrectionType.no
        self.layer.borderWidth = 1
        self.placeholder = text
        self.borderStyle = UITextField.BorderStyle.roundedRect
    }
}


extension UIButton {
    func createCustom(title: String, font: UIFont, color: UIColor) {
        
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
        self.titleColor(for: .normal)
        self.titleLabel?.font = font
        
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.layer.cornerRadius = 5
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
