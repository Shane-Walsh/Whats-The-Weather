//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Shane Walsh on 27/10/2018.
//  Copyright © 2018 Shane Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //set status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func getWeather(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set url
        let url = URL(string:"https://www.weather-forecast.com/locations/London/forecasts/latest")!
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if let error = error {
                
                print(error)
            } else {
                
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    var stringSeparator = "Weather Forcast Summary: </b><span class=\"phrase\">"
                    
                    if let contentArray = dataString?.components(separatedBy: stringSeparator){
                    
                        if contentArray.count > 0 {
                            
                            stringSeparator = "</span>"
                            
                            /* Line below causing error 26:20mins on video */
                            
                            if let newContentArray == contentArray[1].components(separatedBy: stringSeparator) {
                                
                                if newContentArray.count > 0 {
                                    
                                    print(newContentArray[0])
                                }
                            }
                        }
                    }
                }
            }
            
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

