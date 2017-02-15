//
//  feelsViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 13/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class feelsViewController: UIViewController {
    
    
    @IBOutlet var back: UIImageView!
    @IBOutlet var stackview: UIStackView!
    @IBOutlet var likebutton: UIButton!
    @IBOutlet var megalikebutton: UIButton!
    @IBOutlet var dislikebutton: UIButton!
    
    
    
    
    var ratingselected : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blur = UIBlurEffect(style: .dark)
        let blurefect = UIVisualEffectView(effect: blur)
        blurefect.frame = view.bounds
        back.addSubview(blurefect)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let scale2 = CGAffineTransform(scaleX: 0.2, y: 0.2)

        let translate = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //stackview.transform = scale.concatenating(translate).concatenating(scale2)
        likebutton.transform = scale.concatenating(translate)
        megalikebutton.transform = scale.concatenating(translate)
        dislikebutton.transform = scale.concatenating(translate)

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.stackview.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.likebutton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.megalikebutton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.dislikebutton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)

            })

        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func feels(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            print("ps chi")
            ratingselected = "good"
        case 2:
            print("ps chii")
            ratingselected = "great"
        case 3:
            print("ps ño")
            ratingselected = "dislike"
        default:
            break
        }
        
        performSegue(withIdentifier: "showmen", sender: sender)
    }
   

}
