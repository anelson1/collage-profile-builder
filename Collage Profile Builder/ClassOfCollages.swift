//
//  Collages.swift
//  Collage Profile Builder
//
//  Created by Student on 1/25/16.
//  Copyright © 2016 Dank Memes and Son International Shipping Company Express. All rights reserved.
//

import UIKit

class ClassOfCollages: NSObject {
var name = ""
var state = ""
var numberOfStudents = 0
var image = UIImage(named: "Default")
var url = NSURL(string: "")
    
    convenience init(url: NSURL, name: String, state: String, numberOfStudents: Int, image: UIImage) {
        self.init()
        self.name = name
        self.state = state
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.url = url
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
