//
//  TutorialpageViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 09/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    //Se declara un arreglo de tutorialsteps que es el modelo de datos para el tuto
    var tutorialSteps : [Tutorialsteps] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstStep = Tutorialsteps(index: 0, heading: "paso 1", content: "ps aqui bien padre el primer paso", image: #imageLiteral(resourceName: "tuto-intro-1"))
        
        self.tutorialSteps.append(firstStep)
        
        let secondStep = Tutorialsteps(index: 1, heading: "paso 2", content: "ps aqui bien padre el segundo paso", image: #imageLiteral(resourceName: "tuto-intro-2"))
        
        self.tutorialSteps.append(secondStep)
        
        let thirdStep = Tutorialsteps(index: 2, heading: "paso 3", content: "ps aqui bien padre el tercer paso", image: #imageLiteral(resourceName: "tuto-intro-3"))
        
        self.tutorialSteps.append(thirdStep)
        
        dataSource = self
        if let starVC = self.pageviewController(atIndex: 0){
            setViewControllers([starVC], direction: .forward, animated: true, completion: nil)
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func forward(toIndex : Int){
        if let nextVC = self.pageviewController(atIndex: toIndex + 1)
        {
            self.setViewControllers([nextVC], direction: .forward, animated: true, completion: nil)
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
extension TutorialPageViewController :UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TutorialViewController).tutorialstep.index
        index += 1
        print(index)
        return self.pageviewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! TutorialViewController).tutorialstep.index
        index -= 1
        print(index)
        return self.pageviewController(atIndex: index)
    }
    
    
    func pageviewController(atIndex : Int) -> TutorialViewController?{
        if atIndex ==  NSNotFound || atIndex < 0 || atIndex >= self.tutorialSteps.count{
            return nil
        }
        
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier:"WalkthrounghPageContent") as?  TutorialViewController{
            
            pageContentViewController.tutorialstep = self.tutorialSteps[atIndex]
            return pageContentViewController
        }
        
        return nil
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.tutorialSteps.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let pageContentVC = storyboard?.instantiateViewController(withIdentifier: "WalkthrounghPageContent") as? TutorialViewController{
            
            if let tutorialstep = pageContentVC.tutorialstep{
                return tutorialstep.index
            }
        }
        return 0
    }
    
}
