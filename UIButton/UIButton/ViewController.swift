//
//  ViewController.swift
//  UIButton
//
//  Created by maha on 28/02/2024.
//



import UIKit
import SnapKit

class ViewController : UIViewController {
    
    let imageView = UIImageView()
    let imageNameTextField = UITextField()
    let loadImageButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(imageNameTextField)
        view.addSubview(loadImageButton)
        setupUI()
        loadImageButton.addTarget(self, action: #selector(loadImageButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(imageView.snp.width)
        }
        
        imageNameTextField.placeholder = "Enter image name here"
        imageNameTextField.borderStyle = .roundedRect
        view.addSubview(imageNameTextField)
        imageNameTextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        loadImageButton.setTitle("Load Image", for: .normal)
        loadImageButton.backgroundColor = .blue
        loadImageButton.layer.cornerRadius = 5
        loadImageButton.setTitleColor(.white, for: .normal)
        view.addSubview(loadImageButton)
        loadImageButton.snp.makeConstraints { make in
            make.top.equalTo(imageNameTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
    }
    
    @objc func loadImageButtonTapped() {
        if let imageName = imageNameTextField.text, !imageName.isEmpty {
            if let image = UIImage(named: imageName) {
                imageView.image = image
            } else {
                print("Image with name '\(imageName)' not found.")
            }
        }
    }
}
