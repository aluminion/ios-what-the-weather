//
//  ViewController.swift
//  ios-what-the-weather
//
//  Created by Lucas Le on 6/3/16.
//  Copyright © 2016 Lucas Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblResult: UILabel!
    
    @IBOutlet var txtCity: UITextField!
    
    @IBAction func btnWeather(sender: AnyObject) {
        
        var city = txtCity.text
        if city != nil {
            
            city = city?.stringByReplacingOccurrencesOfString(" ", withString: "-")
            
            let url = NSURL(string : "http://www.weather-forecast.com/locations/"+city!+"/forecasts/latest")
            var weather = ""
            if url != nil {
                let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {
                    (data, response, error) -> Void in
                    if error == nil{
                        
                        weather = self.contentHandle(data)
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString:  "º")
                        
                    }else{
                        print("Error occured \(error)")
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        if weather != "" {
                            self.lblResult.text = weather
                        }
                    }
                })
                
                
                
                task.resume()
                
            }else{
                print("URL is nil")
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func contentHandle(data : NSData?) -> String{
        let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
        return self.extractWeatherForecast(urlContent)
    }
    
    func extractWeatherForecast(htmlContent : NSString?) -> String {

        if htmlContent!.containsString("(404)") == false {
            print("Correct city")
            let htmlSplitted = htmlContent!.componentsSeparatedByString("<span class=\"phrase\">")
            if htmlSplitted.count > 1{
                let weatherArray = htmlSplitted[1].componentsSeparatedByString("</span>")
                
                let weather = weatherArray[0] as String
                
                return weather
            }
            
        }else{
            print("Incorrect city")
        }
        return ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

