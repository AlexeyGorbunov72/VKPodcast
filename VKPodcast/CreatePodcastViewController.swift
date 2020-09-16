//
//  CreatePodcastViewController.swift
//  VKPodcast
//
//  Created by Alexey on 16.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class CreatePodcastViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let placeholder = "Введите название подкаста"
    let placeholderColor = #colorLiteral(red: 0.4415394664, green: 0.4893115163, blue: 0.5475963354, alpha: 1)
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новый подкаст"
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
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
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
extension CreatePodcastViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textFields[0].textColor == placeholderColor{
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {[unowned self] in
                self.textFields[0].textColor = UIColor.black
                textView.text = ""
                self.view.layoutIfNeeded()
            })
        
        }
    }
}


