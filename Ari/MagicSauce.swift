//
//  MagicSauce.swift
//  Ari
//
//  Created by Simone Totaro on 07/03/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import Foundation

class MagicSauce: NSObject {



let customerID = "792"
let apiKey = "1m20tg2c0h7al6qegi54ovm3n9"

func authMagicSauce () {
    
    
    let request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/auth")!)
    request.HTTPMethod = "POST"
    let postString = "customer_id=792&api_key=1m20tg2c0h7al6qegi54ovm3n9"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
   // request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        data, response, error in
        
        if error  != nil {
            println(error)
            
        } else {
            
            var jsonError: NSError?
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray {
                // this code is executed if the json is a NSDictionary
                println(json)
            } else {
                // otherwise, this code is executed
                println(jsonError)
            }
        }
        
    }
    
    task.resume()
    
    
}
}

