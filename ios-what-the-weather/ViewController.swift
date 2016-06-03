//
//  ViewController.swift
//  ios-what-the-weather
//
//  Created by Lucas Le on 6/3/16.
//  Copyright © 2016 Lucas Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Start request weather of London")
        let url = NSURL(string : "http://www.weather-forecast.com/locations/London/forecasts/latest")
        
        if url != nil {
            print("URL is not nil")
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
                if error == nil{
                    
                    self.contentHandle(data)
                    
                }else{
                    print("Error occured \(error)")
                }
            })
            task.resume()
        }else{
            print("URL is nil")
        }
        
        
    }
    
    func contentHandle(data : NSData?){
        let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
        self.extractWeatherForecast(urlContent)
    }
    
    func extractWeatherForecast(htmlContent : NSString?){
        let htmlSplitted = htmlContent!.componentsSeparatedByString("<span class=\"phrase\">")
        if htmlSplitted.count > 0{
            let weatherArray = 
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

