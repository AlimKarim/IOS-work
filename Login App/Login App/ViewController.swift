//
//  ViewController.swift
//  Login App
//
//  Created by Alim on 5/31/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var usernameText: UITextField!
    
    
    @IBOutlet var passwordText: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func submitbtn(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
//        let username = NSEntityDescription.insertNewObject(forEntityName: "Login", into: context)
//
//        username.setValue("alim", forKey: "username")
//        username.setValue("1234", forKey: "password")
//        username.setValue(23, forKey: "age")
//
//        do
//        {
//            try context.save()
//            print("saved succesfully")
//        }
//        catch
//        {
//          print("error")
//        }
        
        
       let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Login")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    let username = result.value(forKey: "username") as? String
                    
                    let password = result.value(forKey: "password") as? String
                    
                    if username == usernameText.text && password == passwordText.text
                    {
                        resultLabel.text = "login successsful"
                    }
                    else{
                        resultLabel.text = "login fail"
                    }
                }
            }
            else
            {
                resultLabel.text = "no record found"
            }
        }
        catch
        {
            print("error occur")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

