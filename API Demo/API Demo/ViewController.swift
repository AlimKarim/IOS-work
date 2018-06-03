//
//  ViewController.swift
//  API Demo
//
//  Created by Alim on 6/1/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func findBtn(_ sender: UIButton) {
        
        if let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q="+cityTextField.text!.replacingOccurrences(of: " ", with: "%20")+",uk&appid=69f98bdd4cc9d84cd2298f451404c963"){
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil
            {
                print(error)
            }
            else
            {
                if let urlContent = data
                {
                    do
                    {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                        
                        //print(jsonResult["name"])
                        
                        if let weather = jsonResult["weather"] as? NSArray
                        {
                            let arra = weather[0] as! NSDictionary
                            if let description = arra["description"] as? String{
                                
                                DispatchQueue.main.async(execute: {
                                    
                                    self.resultLabel.text = description
                                })
                            }
                        }
                        
                    }
                    catch
                    {
                        print("json processing fail")
                    }
                    
                }
                else{
                    print("data not found")
                }
            }
            
            
        }
        
            task.resume()
        }
        else
        {
            resultLabel.text = "couldn,t find weather for that city"
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

