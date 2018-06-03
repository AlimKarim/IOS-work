//
//  ViewController.swift
//  Whats The Weather App
//
//  Created by Alim on 5/24/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func resultBtn(_ sender: UIButton) {
        
        let url = URL(string: "https://www.weather-forecast.com/locations/"+(cityTextField.text?.replacingOccurrences(of:" ", with:"-"))!+"/forecasts/latest")!
        let request = NSMutableURLRequest(url: url)
        
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data,response, error in
            
            var message = ""
            
            if error != nil {
                print(error!)
            }
            else{
                
                if let unwrappedData = data
                {
                    
                    let datastring = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    var stringSeperator = "<p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                    
                    if let  contentArray = datastring?.components(separatedBy: stringSeperator)
                    {
                        
                        if contentArray.count > 1
                        {
                            
                            stringSeperator = "</span></p></td>"
                            
                            let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                            
                            if newContentArray.count > 1 {
                                
                                message = newContentArray[0].replacingOccurrences(of:"&deg;", with: "º")
                            }
                            
                        }
                        
                    }
                }
                
                
            }
            
            if message == ""{
                message = "There is no weather found!"
            }
            
            DispatchQueue.main.sync(execute:{
                self.resultLabel.text = message
            })
            
        }
        
        task.resume()
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

