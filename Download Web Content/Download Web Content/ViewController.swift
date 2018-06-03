//
//  ViewController.swift
//  Download Web Content
//
//  Created by Alim on 5/23/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         //let url = URL(string:"https://www.stackoverflow.com")!
        
            //webview.load(URLRequest(url:url))
           // webview.loadHTMLString("<h2>Hello there !</h2>", baseURL: nil)
        
        if let url = URL(string:"https://www.stackoverflow.com"){
                let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                
                data,response,error in
                
                if error != nil{
                    print( error )
                }
                else{
                    if let unwrappedData = data{
                        let datastring = NSString(data:unwrappedData, encoding: String.Encoding.utf8.rawValue )
                        print( datastring )
                    }
                }
            }
            
            task.resume()
            
        }
        print("hELLO")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

