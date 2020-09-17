//
//  CreatePodcastViewController.swift
//  VKPodcast
//
//  Created by Alexey on 16.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class CreatePodcastScrollViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var policyPicker: UIView!
    
    @IBOutlet weak var myScrollview: MyScrollView!
    @IBOutlet weak var chivrone: UIImageView!
    @IBOutlet weak var dropUpView: UIView!
    let placeholder = "Введите название подкаста"
    let placeholderColor = #colorLiteral(red: 0.4415394664, green: 0.4893115163, blue: 0.5475963354, alpha: 1)
    let chekBoxOnImage = UIImage(named: "checkboxOn")
    let chekBoxOffImage = UIImage(named: "checkboxOff")
    @IBOutlet var checkBoxes: [UIButton]!
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var textFields: [UITextView]!
    @IBOutlet weak var downloadButton: UIButton!
    var imagePicker = UIImagePickerController()
    @IBAction func pressImageButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            

            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    var arrayChekboxes: [UIImageView] = []
    @IBAction func pressChekbox(_ sender: UIButton) {
        for button in checkBoxes{
            if sender.tag == button.tag{
                if isThisTagExists(tag: sender.tag){
                    var counter = 0
                    for img in arrayChekboxes{
                        if img.tag == sender.tag{
                            
                            UIView.animate(withDuration: 0.3, animations: {
                                img.alpha = 0
                            }, completion: { [unowned self] _ in
                                img.removeFromSuperview()
                                self.arrayChekboxes.remove(at: counter)
                            })
                            break
                        }
                        counter += 1
                    }
                    
                } else{
                    let imageViewCheckBox = UIImageView()
                    imageViewCheckBox.tag = sender.tag
                    imageViewCheckBox.image = chekBoxOnImage
                    imageViewCheckBox.frame = button.frame
                    imageViewCheckBox.alpha = 0
                    self.myScrollview.addSubview(imageViewCheckBox)
                    arrayChekboxes.append(imageViewCheckBox)
                    UIView.animate(withDuration: 0.3, animations: {
                        imageViewCheckBox.alpha = 1
                    })
                }
                
            }
        }
    }
    
    @IBAction func pressDownloadButton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новый подкаст"
        nextButton.isEnabled = false
        self.navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
        nextButton.backgroundColor = UIColor(displayP3Red: 0.286, green: 0.525, blue: 0.8, alpha: 0.4)
        nextButton.layer.cornerRadius = 10
        makeRoundTextFields()
        buttonView.layer.cornerRadius = 10
        buttonView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.12)
        buttonView.layer.borderWidth = 1
        downloadButton.layer.cornerRadius = 10
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.borderColor = CGColor(srgbRed: 0.247, green: 0.541, blue: 0.878, alpha: 1)
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnDropUp(_:)))
        dropUpView.addGestureRecognizer(tapGesture)
        let policyFrame = CGRect(x: 12, y: view.bounds.height, width: view.bounds.width - 24, height: 0)
        policyPicker.frame = policyFrame
        policyPicker.isHidden = true
        
    }
    @objc func tapOnDropUp(_ sender: Any){
        view.bringSubviewToFront(policyPicker)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.policyPicker.isHidden = false
            self.policyPicker.frame.size.height += 500
        })
    }
    func isThisTagExists(tag: Int) -> Bool{
        for img in arrayChekboxes{
            if img.tag == tag{
                return true
            }
        }
        return false
    }
    private func makeRoundTextFields(){
        textFields[0].text = placeholder
        textFields[0].textColor = placeholderColor
        for textView in textFields{
            textView.delegate = self
            textView.layer.cornerRadius = 10
            textView.layer.borderWidth = 1
            textView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.12)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
        fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        
        picker.dismiss(animated: true) { [unowned self ] in
            self.buttonView.isHidden = true
            self.buttonImage.isHidden = true
            self.imageView.isHidden = false
            self.view.layoutIfNeeded()
            
            UIView.transition(with: self.imageView,
                              duration: 0.3,
                              options: .transitionFlipFromLeft,
                              animations: { [unowned self] in
                                
                                self.imageView.image = image
                                self.imageView.layer.borderWidth = 1
                                self.imageView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.12)
                                
                    }, completion: nil)
            
        }
    
    
        
    }
}
extension CreatePodcastScrollViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textFields[0].textColor == placeholderColor && textView.tag == 0{
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {[unowned self] in
                self.textFields[0].textColor = UIColor.black
                textView.text = ""
                
            })
        
        }
    }
}


