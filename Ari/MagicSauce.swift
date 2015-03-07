//
//  MagicSauce.swift
//  Ari
//
//  Created by Simone Totaro on 07/03/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import Foundation

let customerID = "792"
let apiKey = "1m20tg2c0h7al6qegi54ovm3n9"

func authMagicSauce () {
    
    
    let request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/auth")!)
    request.HTTPMethod = "POST"
    let postString = "customer_id=\(customerID)&api_key=\(apiKey)"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        data, response, error in
        if error  != nil {
            println(error)
            
        } else {
            
            var jsonError:NSError?
            let jsonOptional: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
            
            println(jsonOptional)
            
        }
        
    }
    
    task.resume()
    
    
}

