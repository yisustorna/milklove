//
//  Tutorialsteps.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 09/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import Foundation
import UIKit


class Tutorialsteps : NSObject{
    var index = 0
    var heading = ""
    var content = ""
    var image: UIImage!
    
    
    init(index : Int,heading: String,content:String,image:UIImage) {
        self.index = index
        self.heading = heading
        self.content = content
        self.image = image
    }
    
}
