//
//  TimeCodeCollectionViewCell.swift
//  VKPodcast
//
//  Created by Alexey on 17.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class TimeCodeCollectionViewCell: UICollectionViewCell {
    var data: TimeCode?{
        didSet{
            contentLabel.text = data?.content
            timeTitle.text = data?.time
            for viewBack in backViews{
                viewBack.layer.cornerRadius = 10
                viewBack.layer.borderWidth = 1
                viewBack.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.12)
            }
        }
    }
    @IBOutlet var backViews: [UIView]!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeTitle: UILabel!
    
}
