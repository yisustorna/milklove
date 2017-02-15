//
//  ViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 09/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let hasviewtutorial = defaults.bool(forKey: "hasviewedtutorial")
        if hasviewtutorial{
            return
        }
        
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "WalkthrounghController") as? TutorialPageViewController{
            self.present(pageVC, animated: true, completion: nil)
            print("tuto")
        }
    }*/
    


}

