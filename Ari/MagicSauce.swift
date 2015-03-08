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
                            let percentage = array[i]["value"] as Double
                            NSUserDefaults.standardUserDefaults().setDouble(percentage, forKey: "BIG5_Openness")
                            NSUserDefaults.standardUserDefaults().synchronize()
                        }
                        else if trait == "BIG5_Neuroticism"
                        {
                            print("BIG5_Neuroticism: ")

                            println(array[i]["value"] as Double)
                            let percentage = array[i]["value"] as Double
                            NSUserDefaults.standardUserDefaults().setDouble(percentage, forKey: "BIG5_Neuroticism")
                            NSUserDefaults.standardUserDefaults().synchronize()
                        }
                        else if trait == "BIG5_Conscientiousness"
                        {
                            print("BIG5_Conscientiousness: ")

                            println(array[i]["value"] as Double)
                            let percentage = array[i]["value"] as Double
                            NSUserDefaults.standardUserDefaults().setDouble(percentage, forKey: "BIG5_Conscientiousness")
                            NSUserDefaults.standardUserDefaults().synchronize()

                        }
                        else if trait == "BIG5_Agreeableness"
                        {
                            print("BIG5_Agreeableness: ")

                            println(array[i]["value"] as Double)
                            let percentage = array[i]["value"] as Double
                            NSUserDefaults.standardUserDefaults().setDouble(percentage, forKey: "BIG5_Agreeableness")
                            NSUserDefaults.standardUserDefaults().synchronize()

                        }
                        else if trait == "BIG5_Extraversion"
                        {
                            print("BIG5_Extraversion: ")
                            println(array[i]["value"] as Double)
                            let percentage = array[i]["value"] as Double
                            NSUserDefaults.standardUserDefaults().setDouble(percentage, forKey: "BIG5_Extraversion")
                            NSUserDefaults.standardUserDefaults().synchronize()
                        }
                    }
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

        let opennes = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Openness")
        let neuroticism =  NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Neuroticism")
        let conscientiousness = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Conscientiousness")
        let agreeableness = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Agreeableness")
        let extraversion = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Extraversion")

        let riskiness = ((opennes * 4) + (conscientiousness * 1.5) + (extraversion * 0.5) + (neuroticism * 4))
        
        if riskiness < 4
        {
            //Low risk
            let arrayStocks = ["PSA","SPG","BXP","VNO","AVB","HCP"]
            NSUserDefaults.standardUserDefaults().setObject(arrayStocks, forKey: "stocks")
            NSUserDefaults.standardUserDefaults().synchronize()

        }
        else if riskiness < 7
        {
           //Medium risk
            let arrayStocks = ["AAPL","GOOG","GE","JNJ","MSFT","XOM"]
            NSUserDefaults.standardUserDefaults().setObject(arrayStocks, forKey: "stocks")
            NSUserDefaults.standardUserDefaults().synchronize()
           
        }
        else
        {
            //high risk
            let arrayStocks = ["AAL","URI","AEO","DPZ","AOL","WAB"]
            NSUserDefaults.standardUserDefaults().setObject(arrayStocks, forKey: "stocks")
            NSUserDefaults.standardUserDefaults().synchronize()

            
        }
        
    }
    
}

