//
//  Plaid.swift
//  Ari
//
//  Created by Simone Totaro on 07/03/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import Foundation


//  CLEAN CODE AND IMPLEMENT LOGIN

class Plaid: NSObject {
    
    func getCategories() {
        
        let url = NSURL(string: "https://tartan.plaid.com/categories")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error != nil {
                
                println(error)
                
                
            } else {
                var jsonError: NSError?
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray {
                    // this code is executed if the json is a NSDictionary
                    println(json)
                } else {
                    // otherwise, this code is executed
                    println("shit")
                }
            }
            
        }
        
    }
    
    func getBalance() {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/balance")!)
        request.HTTPMethod = "POST"
        let postString = "client_id=test_id&secret=test_secret&access_token=test"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error  != nil {
                println(error)
                
            } else {
                var jsonError: NSError?
                println(data)
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                    println(json)
                } else {
                    // otherwise, this code is executed
                    println("shit")
                }
                
                
            }
            
        }
        
        task.resume()
        
    }
    
    func getTransactionData() {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/connect/get")!)
        request.HTTPMethod = "POST"
        
        let dic = ["client_id":"test_id","secret":"test_secret","access_token":"test"] as NSDictionary
        
        //        let dic = ["client_id":"test_id","secret":"test_secret","access_token":"test","options":["gte":"2014-03-12 9:53:23","lte":"2014-04-12 9:53:23"]] as NSDictionary
        
        
        let postString = NSJSONSerialization .dataWithJSONObject(dic, options: nil , error: nil)
        
        request.HTTPBody = postString
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error  != nil {
                println(error)
                
            } else {
                var jsonError: NSError?
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                    //println(json)
                    
                    let array = json["transactions"] as NSArray
                    let arrayIncomes = NSMutableArray()
                    let arrayOutcomes = NSMutableArray()
                    
                    var totalIncomes: Double = 0
                    var totalOutcomes: Double = 0
                    
                    
                    for (var i=0;i<array.count;i++)
                    {
                        let amount: Double = array[i]["amount"] as Double
                        
                        
                        if (amount < 0)
                        {
                            totalIncomes += amount
                            arrayIncomes.addObject(array[i])
                        }
                        else
                        {
                            totalOutcomes += amount
                            arrayOutcomes.addObject(array[i])
                        }
                        
                        
                    }
                    
                    println("------------ INCOMES ----------")
                    for (var j=0;j<arrayIncomes.count;j++)
                    {
                        print(arrayIncomes[j]["name"] as NSString)
                        print(" : ")
                        println(arrayIncomes[j]["amount"] as Double)
                    }
                    
                    println("")
                    
                    println("Final amount: $\(-totalIncomes)")
                    
                    
                    println("------------ OUTCOMES ----------")
                    for (var g=0;g<arrayOutcomes.count;g++)
                    {
                        print(arrayOutcomes[g]["name"] as NSString)
                        print(" : ")
                        println(arrayOutcomes[g]["amount"] as Double)
                    }
                    
                    println("")
                    println("Final amount: -$\(totalOutcomes)")
                    
                    println("------------ Savings ----------")
                    println("$\(-totalIncomes-totalOutcomes) to save")
                    println("$\((-totalIncomes-totalOutcomes)*0.2) to invest")

                    
                    //  println(array)
                } else {
                    // otherwise, this code is executed
                    println("shit")
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
    func addUserSubmit() {
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/connect")!)
        request.HTTPMethod = "POST"
        let postString = "client_id=test_id&secret=test_secret&username=plaid_test&password=plaid_good&type=wells&pin=1234"
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
    
    func addProfie () {
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/auth")!)
        request.HTTPMethod = "POST"
        let postString = "client_id=test_id&secret=test_secret&username=plaid_test&password=plaid_good&type=wells"
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
    
    func getData () {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/auth/get")!)
        request.HTTPMethod = "POST"
        let postString = "client_id=test_id&secret=test_secret&access_token=test"
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
    
}