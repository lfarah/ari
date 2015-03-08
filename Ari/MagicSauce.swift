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
    
    func profileMagicSauceFixed() {
    
        var url = NSURL(string: "http://applymagicsauce.com/test/100003107357974/CAACBG5OIpVABAOlWPZC8Rr1K98ScvgSvQZAL2NbDOP2lMWf6dljqzBqdePpVwdbhMf6QoZAQ26ywrlcitoQCof3TYA69D1b4wQyxtZAMeZCHL6gUx8QZArZCZBtrrZCPMJ78LT7uqz3TalDHmZBsSQk3S3rJmo0RYDgvEho7PZANi7ThCbHH9xkcyLkugbCeWxxwT54uOSPFqO5cVzMGrTgPN17ZCQe31Yp2OMIZD")
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
        
            
            if error != nil {
                
                println("shit1")
                
            } else {
                
                
                var jsonError: NSError?
                //            println(data)
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                    //                println(json)
                    
                 //   println(json["predictions"])
                    let array = json["predictions"] as NSArray
                    
                    
                    println("======= BIG 5 =======")
                    for (var i=0;i<array.count;i++)
                    {
                        let trait = array[i]["trait"] as String
                        if  trait == "BIG5_Openness"
                        {
                            print("BIG5_Openness: ")

                            println(array[i]["value"] as Double)
                        }
                        else if trait == "BIG5_Neuroticism"
                        {
                            print("BIG5_Neuroticism: ")

                            println(array[i]["value"] as Double)
                        }
                        else if trait == "BIG5_Conscientiousness"
                        {
                            print("BIG5_Conscientiousness: ")

                            println(array[i]["value"] as Double)

                        }
                        else if trait == "BIG5_Agreeableness"
                        {
                            print("BIG5_Agreeableness: ")

                            println(array[i]["value"] as Double)

                        }
                        else if trait == "BIG5_Extraversion"
                        {
                            print("BIG5_Extraversion: ")
                            println(array[i]["value"] as Double)

                        }
                    
                    }
                    
//                    for type in json {
                    
//BIG5_Openness
//BIG5_Neuroticism
//BIG5_Conscientiousness
//BIG5_Agreeableness
//BIG5_Extraversion
                    //
                }
                else
                {
                    // otherwise, this code is executed
                    println(jsonError)
                }
                
            }
            
        
        
        }
        
        task.resume()
    }
    
    func profileMagicSauce () {

        
//    var  userid  = "100003107357974"
//        
//        var stringToken = "3r54pl6jqsrrgvrm95jku8ekmk"
//        
//        
//        var request = NSMutableURLRequest(URL: NSURL(string: "http://api-v2.applymagicsauce.com/like_ids&=\(userid)")!)
//        
//        let session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        
//        var err:NSError?
//        request.setValue(stringToken, forHTTPHeaderField: "X-Auth-Token")
//        request.setValue("application/json", forHTTPHeaderField: "Content-type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(likes, options: nil, error: &err)
//        
//        var task = session.dataTaskWithRequest(request, completionHandler:{data, response, error -> Void in
//            
//            if error != nil {
//                println(error)
//                
//            } else {
//                
//                
//                var jsonError: NSError?
//                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray {
//                    
//                    println(json)
//                    
//                    
//                } else {
//                    
//                    println("we are fucked")
//                    
//                    
//                }
//                
//                
//                
//                
//            }
//            
//        })
//        
//        task.resume()
//        
    }
    
}

