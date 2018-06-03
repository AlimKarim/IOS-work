//
//  FirstViewController.swift
//  todoList
//
//  Created by Alim on 5/19/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count;
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"Cell" )
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items,forKey:"items")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let itemobjects = UserDefaults.standard.object(forKey:"items")
        
        if let tempitems = itemobjects as? [String]{
            items = tempitems
        }
        
       table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

