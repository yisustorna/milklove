//
//  UserdetaliViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 13/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class UserdetaliViewController: UIViewController {

    @IBOutlet var backgroundimage: UIImageView!
    @IBOutlet var tableview: UITableView!
    @IBOutlet var ratingbutton: UIButton!
    
    var user : ejem!
    
    
    @IBAction func closealv(segue: UIStoryboardSegue){
        
        if let feelsVC = segue.source as? feelsViewController
        {
            if let rating = feelsVC.ratingselected
            {
                print(rating)
                self.user.rating = rating
                let image = UIImage(named: self.user.rating)
                self.ratingbutton.setImage(image, for: .normal)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.backgroundimage.image = self.user.ima
        self.tableview.tableFooterView  = UIView(frame: .zero)
        let image = UIImage(named: self.user.rating)
        self.ratingbutton.setImage(image, for: .normal)

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
        
    


}
