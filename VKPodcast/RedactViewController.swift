//
//  RedactViewController.swift
//  VKPodcast
//
//  Created by Alexey on 17.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class RedactViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var data : [TimeCode] = []
    @IBAction func pressAddButton(_ sender: Any) {
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timecode", for: indexPath) as! TimeCodeCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Редактирование"
    }
    

    
}

struct TimeCode{
    var time: String?
    var content: String?
}
