//
//  AddNewCard.swift
//  work 6
//
//  Created by Alex Saroyan on 14.04.24.
//
import UIKit

class AddNewCardViewController: UIViewController {
    
    private let satauriTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter satauri"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let agweraTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter agwera"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(satauriTextField)
        view.addSubview(agweraTextField)
        
        satauriTextField.translatesAutoresizingMaskIntoConstraints = false
        agweraTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            satauriTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            satauriTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            satauriTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            satauriTextField.heightAnchor.constraint(equalToConstant: 40),
            
            agweraTextField.topAnchor.constraint(equalTo: satauriTextField.bottomAnchor, constant: 20),
            agweraTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            agweraTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            agweraTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let logos = ["Frame 62", "Frame 63", "Frame 64", "Frame 65"]
        var previousLogoImageView: UIImageView?
        for logoName in logos {
            let logoImageView = UIImageView(image: UIImage(named: logoName))
            logoImageView.contentMode = .scaleAspectFit
            view.addSubview(logoImageView)
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                logoImageView.heightAnchor.constraint(equalToConstant: 40),
                logoImageView.widthAnchor.constraint(equalToConstant: 40)
            ])
            
            if let previousLogoImageView = previousLogoImageView {
                logoImageView.topAnchor.constraint(equalTo: previousLogoImageView.bottomAnchor, constant: 20).isActive = true
            } else {
                logoImageView.topAnchor.constraint(equalTo: agweraTextField.bottomAnchor, constant: 40).isActive = true
            }
            
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
            previousLogoImageView = logoImageView
        }
        
        let button = UIButton(type: .system)
        button.setTitle("damateba", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(damatebaButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: previousLogoImageView!.bottomAnchor, constant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 226),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc private func damatebaButtonTapped() {
        // Handle button tap action here
    }
}
