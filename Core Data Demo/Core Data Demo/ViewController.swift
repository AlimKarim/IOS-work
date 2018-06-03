//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Alim on 5/31/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("kamin", forKey: "username")
        newUser.setValue("12345", forKey: "password")
        newUser.setValue(4, forKey: "age")
        
        do{
            //try context.save()
            //print("saved")
        }
        catch
        {
            print("There was an error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        //request.predicate = NSPredicate(format: "username= %@", "anthony")
      //  request.predicate = NSPredicate(format: "age < %@", "5")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "username")
                    {
                      
                 /*        result.setValue("Dolley", forKey: "username")
                        context.delete(result)
                        
                        do
                        {
                            try context.save()
                           // print()
                        }
                        catch
                        {
                            print("Rename fail")
                        }
 
                 */
                
                        print(username)
                    }
                }
            }
        }
        catch
        {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

