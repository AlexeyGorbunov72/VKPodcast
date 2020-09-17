//
//  ViewController.swift
//  VKPodcast
//
//  Created by Alexey on 16.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let plusImage: UIImageView = {
        let image = UIImage(named: "plusIcon")
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Добавьте первый подкаст"
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.5084650517, green: 0.5482006669, blue: 0.6023002267, alpha: 1)
        label.text = "Добавляйте, редактируйте и делитесь подкастом вашего сообщества."
        return label
    }()
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Добавить подкаст", for: .normal)
        button.titleLabel?.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.2863724232, green: 0.5237077475, blue: 0.7977352738, alpha: 1)
        button.addTarget(self, action: #selector(pressNext(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func pressNext(_ button: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "createPodcastScroll") as! CreatePodcastScrollViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        view.addSubview(nextButton)
        view.addSubview(subTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(plusImage)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            plusImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16),
            plusImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nextButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 24),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 166),
            nextButton.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }


}

