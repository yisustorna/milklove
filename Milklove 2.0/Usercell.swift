//
//  Usercell.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 10/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import Foundation
import UIKit

class Usercell: UITableViewCell{
    
    @IBOutlet var Userimage: UIImageView!
    @IBOutlet var Namelabel: UILabel!
    @IBOutlet var Datelabel: UILabel!
    @IBOutlet var Weightlabel: UILabel!
    
    @IBOutlet var Userimagefree: UIImageView!
    @IBOutlet var Namelabelfree: UILabel!
    @IBOutlet var Datelabelfree: UILabel!
    @IBOutlet var Weightlabelfree: UILabel!
    //segunda celda
    @IBOutlet var tutulaso: UILabel!
    
}

class ejem : NSObject{
    
    var name : String!
    var ima : UIImage!
  // var activo : Bool = false
    var rating : String = ""
    
    
    init(name:String,ima:UIImage) {
        self.name = name
        self.ima = ima
    }
    
}
