//
//  MagicSauce.swift
//  Ari
//
//  Created by Simone Totaro on 07/03/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import Foundation

class MagicSauce: NSObject {
    
    
    var paramsProfile = NSMutableDictionary()
    func authMagicSauce () {
        
        var paramsBody:Dictionary<String,String> = ["customer_id":"792","api_key":"1m20tg2c0h7al6qegi54ovm3n9"]
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/auth")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        var err:NSError?
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(paramsBody, options: nil, error: &err)
        var task = session.dataTaskWithRequest(request, completionHandler:{data, response, error -> Void in
            
            if error != nil {
                
                println("shit")
                
            } else {
                
                
                var jsonError: NSError?
                //            println(data)
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                    //                println(json)
                    
                    self.paramsProfile = json as NSMutableDictionary
                    
                    
                    println(self.paramsProfile)
                    
                } else {
                    // otherwise, this code is executed
                    println("shit")
                }
                
            }
            
            
        })
        
        task.resume()
        
        
    }
    
    func profileMagicSauce () {
        
        var likes =  ["114816368587977","227113537413282","332007683664754","527070694073016","459735864142419","1461971014067073","166666360110806","321133531419712","818824488163482","274252200563","585351728275326","235109336656198","124905230916542","368117946611127","1536919493214388","668831753230466","269428459847723","654509461313423","587111798087919","170788526418339","1589757011252800","549729288390674","515308808488283","310365192499245","688306871205957"]
        
        var  userid  = "100003107357974"
        
        var stringToken = "vrfv0f9a9shue9onhln1tccik1"
        
        
        var request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/like_ids&=\(userid)")!)
        
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var err:NSError?
        request.setValue(stringToken, forHTTPHeaderField: "X-Auth-Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(likes, options: nil, error: &err)
        
        var task = session.dataTaskWithRequest(request, completionHandler:{data, response, error -> Void in
            
            if error != nil {
                println(error)
                
            } else {
                
                
                var jsonError: NSError?
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray {
                    
                    println(json)
                    
                    
                } else {
                    
                    println("we are fucked")
                    
                    
                }
                
                
                
                
            }
            
        })
        
        task.resume()
        
    }
    
}

