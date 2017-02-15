//
//  TutorialViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 09/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet var titulo: UILabel!
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var Descriptontext: UILabel!
    @IBOutlet var pagintion: UIPageControl!
    @IBOutlet var nextbutton: UIButton!
    //var index = 0
    
    var tutorialstep : Tutorialsteps!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titulo.text = self.tutorialstep.heading
        self.imageview.image = self.tutorialstep.image
        self.Descriptontext.text = self.tutorialstep.content
        self.pagintion.currentPage = self.tutorialstep.index
        
        switch self.tutorialstep.index {
        case 0...1:
            self.nextbutton.setTitle("next", for: .normal)
        case 2:
            self.nextbutton.setTitle("comenzar", for: .normal)
        default:
            break
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginbutton(_ sender: Any) {
        switch self.tutorialstep.index {
        case 0...1:
            let pageViewController = parent as! TutorialPageViewController
            pageViewController.forward(toIndex: self.tutorialstep.index)
        case 2:
            
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "hasviewedtutorial")
            
            self.dismiss(animated: true, completion: {
                //aqui pides los permisos para la camra y todo eso
            })
        default:
            break
        }
        
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
