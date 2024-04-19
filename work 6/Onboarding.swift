//
//  ViewController.swift
//  work 6
//
//  Created by Alex Saroyan on 14.04.24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(image: UIImage(named: "Group 4"))
        backgroundImage.translatesAutoresizingMaskIntoConstraints = true
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        
        let verticalTextLabel = UILabel()
        verticalTextLabel.text = "შედი\nაპლიკაციაში\nდა იწუწუნე\nრამდენიც გინდა"
        verticalTextLabel.font = UIFont(name: "Helvetica", size: 30)
        verticalTextLabel.textColor = .white
        verticalTextLabel.numberOfLines = 0
        verticalTextLabel.textAlignment = .left
        
        stackView.addArrangedSubview(verticalTextLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("დაწყება", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 117/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont(name: "FiraGO", size: 16)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: 123),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func startButtonTapped() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            return
        }
        let mainPageVC = MainPageViewController()
        sceneDelegate.window?.rootViewController?.present(mainPageVC, animated: true, completion: nil)
    }
}
