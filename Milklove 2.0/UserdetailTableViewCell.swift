//
//  UserdetailTableViewCell.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 13/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class UserdetailTableViewCell: UITableViewCell {
    
    @IBOutlet var Keyvalue: UILabel!
    @IBOutlet var value: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UserdetaliViewController : UITableViewDataSource
{

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Userdetailcell", for: indexPath) as! UserdetailTableViewCell
        
        switch indexPath.row {
        case 0:
          cell.Keyvalue.text = "Nombre"
            cell.value.text = self.user.name
        case 1:
            cell.Keyvalue.text = "Nombre2"
            cell.value.text = self.user.name
        /*case 2:
            cell.Keyvalue.text = "fav"
            if user.activo{
            cell.value.text = "chi"
            }else{
            cell.value.text = "ño"
            }*/
            
        default:
            break
        }
        
        return cell
    }
    
  
}


extension UserdetaliViewController : UITableViewDelegate{
 

}
