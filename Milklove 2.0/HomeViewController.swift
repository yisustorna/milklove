//
//  HomeViewController.swift
//  Milklove 2.0
//
//  Created by YISUS ZAVAlA on 10/02/17.
//  Copyright © 2017 JESUS ZAVAlA. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    //En este arreglo de tipo ejem(clase) vamos a guardar todo para usarlo en la vista
    var names : [ejem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "nariz", style: .plain, target: nil, action: nil)
        
        //Declaracion temporal de datos para la vista
        var name = ejem(name: "la concha de la lora",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora2",ima: #imageLiteral(resourceName: "tuto-intro-2 "))
        names.append(name)
        
        name = ejem(name: "la concha de la lora3",ima: #imageLiteral(resourceName: "angel"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora4",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        name = ejem(name: "la concha de la lora5",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)
        
        
        name = ejem(name: "la concha de la lora6",ima: #imageLiteral(resourceName: "tuto-intro-1"))
        names.append(name)

    
    }
    
    /* @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
    
    }*/

    
    @IBAction func closealv(segue: UIStoryboardSegue){
        
        if let feelsVC = segue.source as? feelsViewController
         {
         if let rating = feelsVC.ratingselected
         {
         print(rating)
         }
         
         }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    navigationController?.hidesBarsOnSwipe = true

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //se usa el userdefaults para guardar ua variable que es la que nos dice si es la primera vez que entra
        let defaults = UserDefaults.standard
        //En la variable hasviewtutorial revisamos la variable booleana de "hasviewedtutorial qie si es verdadera quiere decir que le tutorial ya fue visto"
        let hasviewtutorial = defaults.bool(forKey: "hasviewedtutorial")
        if hasviewtutorial{
            return
        }
        //si es falsa entra a este codigo que es el que nos manda al tutorial
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "WalkthrounghController") as? TutorialPageViewController{
            self.present(pageVC, animated: true, completion: nil)
            print("tuto")
        }
    }
    
    //Esconder barra superior donde se encuentra la hora y la bateria etc
    override var prefersStatusBarHidden: Bool{
        return true
    }

    // MARK: - UITableViewDataSource
    
    
    //funcion de la tableview donde le decimos el numero de secciones que vamos a mostrar
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //numero de filas que se van a mostrar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numero de de filas que se van a mostrar
        return self.names.count
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let namess = names[indexPath.row]
        // le asignamos el id de la celda custom que vamos a utilizar
        let CellID = "Usercell"
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! Usercell
        cell.Userimage.image = namess.ima
        cell.Namelabel.text = namess.name
        
        //cell.Userimage.layer.cornerRadius = 42.0
        //cell.Userimage.clipsToBounds = true
        
       /* if namess.activo {
         cell.accessoryType = .checkmark
        }else{
         cell.accessoryType = .disclosureIndicator

        }*/
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete{
            
            self.names.remove(at: indexPath.row)
        print("borrar")
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //compartir
        let shareaction = UITableViewRowAction(style: .default, title: "Compartir"){ (action,indexPath)in
        let sharedefaulttext = ["Mi bebe a aumentado \(self.names[indexPath.row].name!)"] as NSArray
        let shareima = self.names[indexPath.row].ima
        let shareitems:Array = [sharedefaulttext,shareima!] as [Any]
        let active = UIActivityViewController(activityItems: shareitems, applicationActivities: nil)
            
         
            self.present(active, animated: true, completion: nil)
        }
        
        let Deleteaction = UITableViewRowAction(style: .default, title: "Borrar"){ (action,indexPath)in
         self.names.remove(at: indexPath.row)
         self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        shareaction.backgroundColor = UIColor.blue
        
        
        return [shareaction,Deleteaction]
    }
    
    
   // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("fila \(indexPath.row) selecionada")
        
         /*let alert = UIAlertController(title: nil, message: "EDITAR", preferredStyle: .actionSheet)
         let cancel = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
         alert.addAction(cancel)
         let edit = UIAlertAction(title: "EDIT", style: .default){(action) in
                let Nedit = self.names[indexPath.row]
                Nedit.activo = !Nedit.activo
            tableView.reloadData()
         }
        alert.addAction(edit)
         self.present(alert, animated: true, completion: nil)*/
    }
    
    
    //Aqui es donde la pasamos los datos para la siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //aqio le decimos que si el segue que va a seguir tiene el identificador que le damos va a ejecutar el codigo
        if segue.identifier == "ShowDetail"{
            
            //aqui le decimos cual es la que vamos a selecionar
            if let indexpath = self.tableView.indexPathForSelectedRow{
                //aqui asignamos la celda selecionada
                let selectedrow = self.names[indexpath.row]
                //aqui declaramos una variable de tipo de la vista a la que vamos a seguir con el segue
                let destination = segue.destination as! UserdetaliViewController
                //en la vista userdetailviewcontroller se declara la variable user que es a la que le vamos a pasar los datos de la celda selecionada
                destination.user = selectedrow
                
            
            }
        
        }
        
    }

    
    
}
