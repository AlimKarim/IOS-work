//
//  ViewController.swift
//  Downloading image from web
//
//  Created by Alim on 6/1/18.
//  Copyright © 2018 Alim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bachImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true)
        
        if documentsPath.count > 0
        {
            let documentDirectory = documentsPath[0]
            
            let restorePath = documentDirectory + "/bach.jpg"
            
            bachImageView.image = UIImage(contentsOfFile: restorePath)
        
        }
        
        /*
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/260px-Johann_Sebastian_Bach.jpg")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data,response,error in
            
            if error != nil
            {
                print(error)
            }
            else
            {
               if let data = data{
                    if let bachimage = UIImage(data: data)
                    {
                        self.bachImageView.image = bachimage
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true)
                        
                        if documentsPath.count > 0
                        {
                                let documentDirectory = documentsPath[0]
                            
                                let savePath = documentDirectory + "/bach.jpg"
                                
                                do{
                                    try UIImageJPEGRepresentation(bachimage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                    
                                    
                                }
                                catch
                                {
                                    
                                }
                            
                        }
                    }
                }
            }
            
            
        }
        
        task.resume() */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

