//
//  SingleViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 10/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    var names : [ejem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var name = ejem(name: "la concha de la lora",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora2",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora3",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora4",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora5",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

}
extension SingleViewController : UITableViewDataSource{
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //numero de de filas que se van a mostrar
        return self.names.count
        
    }
    
    /**/
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let namess = names[indexPath.row]
        // Configure the cell...
        let CellID = "Usercell"
        //let CellID2 = "secondcell"
        
       
    
        
        let cell = self.tableview.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! Usercell
        cell.Userimagefree.image = #imageLiteral(resourceName: "angel")
        cell.Namelabelfree.text = namess.name
        
       /* let cell2 = tableView.dequeueReusableCell(withIdentifier: CellID2, for: indexPath) as! Usercell
        cell2.tutulaso.text = namess.name*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete{
            
            self.names.remove(at: indexPath.row)
            print("borrar")
        }
        
        tableView.deleteRows(at: [indexPath], with: .bottom)
    }


    
}
