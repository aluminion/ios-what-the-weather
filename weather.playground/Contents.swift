//: Playground - noun: a place where people can play

import UIKit

let url = NSURL(string : "http://www.weather-forecast.com/locations/London/forecasts/latest")

func handleRequest(data : NSData?, response: NSURLResponse?, error: NSError?){
    print("Request url response")
    var urlError = false
    
    if error != nil {
        print("No error")
    }else{
        print("ERROR")
    }
}

if url != nil {
    let urlRequest = NSURLRequest(URL: url!)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest, completionHandler: {
        (data, response, error) -> Void in
        handleRequest(data, response: response, error: error)
    })
    
    print("Request url response done")
}

