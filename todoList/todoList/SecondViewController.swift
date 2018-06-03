//
//  SecondViewController.swift
//  todoList
//
//  Created by Alim on 5/19/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: UIButton) {
        
        let itemobjects = UserDefaults.standard.object(forKey : "items")
        var items:[String]
        
        if let tempitems = itemobjects as? [String] {
            items = tempitems
            items.append(itemTextField.text!)
        }
        else{
            items = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey : "items")
        itemTextField.text = ""
    
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

