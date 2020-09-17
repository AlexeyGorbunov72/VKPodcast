//
//  ChoosePrivacyViewController.swift
//  VKPodcast
//
//  Created by Alexey on 17.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
protocol ChoosePrivacy {
    func choosenPrivacyNamed(named: String)
}
class ChoosePrivacyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var delegate: ChoosePrivacy?
    let data = ["Видно всем", "Только мне", "Только друзьям"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! ChooseCollectionViewCell
        cell.mainLabel.text = data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.choosenPrivacyNamed(named: data[indexPath.row])
    }

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        view.backgroundColor = .black
    }
    

    

}
