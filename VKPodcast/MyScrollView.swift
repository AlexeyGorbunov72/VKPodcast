//
//  MyScrollView.swift
//  VKPodcast
//
//  Created by Alexey on 17.09.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//
import UIKit
class MyScrollView: UIScrollView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        print("Works")
        return false
    }
}
