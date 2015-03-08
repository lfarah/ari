//
//  LevelMoney.swift
//  Ari
//
//  Created by Lucas Farah on 3/7/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class LevelMoney: NSObject
{
    
    func getEverything()
    {
        self.getPredictions("https://api.levelmoney.com/api/v2/hackathon/get-all-transactions")
        //self.getPredictions("https://api.levelmoney.com/api/v2/hackathon/projected-transactions-for-month")
        self.getPastTransactions("https://api.levelmoney.com/api/v2/hackathon/projected-transactions-for-month")

    }
    func getPredictions(urlString: String)
    {
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "POST"
        
        //Header
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //Body
        let dic = [
            "args": ["uid": 1110570164,
                    "token": "119947F2D985C3788998543A3D3AD90C",
                    "api-token": "HackathonApiToken"],
            
            "year": 2014,
            "month":9];
        
        let postString = NSJSONSerialization .dataWithJSONObject(dic, options: nil , error: nil)
        
        request.HTTPBody = postString
        
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
                    
                    var arrayCredit = NSMutableArray()
                    var arrayDebit = NSMutableArray()
                    
                    var arrayCC = NSMutableArray()
                    var arrayChecking = NSMutableArray()
                    
                    for (var i=0;i<array.count;i++)
                    {
                        let type = array[i]["account-id"] as NSString
                        if type == "nonce:comfy-cc/comfy"
                        {
                            arrayCC.addObject(array[i])
                            
                        }
                        else
                        {
                            arrayChecking.addObject(array[i])
                        }
                    }
                    
                    //ArrayCC
                    println("========= ArrayCC ==========")
                    for (var i=0;i<arrayCC.count;i++)
                    {
                        let stringDate = arrayCC[i]["transaction-time"] as NSString
                        if stringDate.containsString("2014-09")
                        {
                            let amount = arrayCC[i]["amount"] as Double
                            
                            if amount>0
                            {
                                arrayCredit.addObject(arrayCC[i])
                            }
                            else
                            {
                                arrayDebit.addObject(arrayCC[i])
                                
                            }
                        }
                        
                    }
                    
                    
                    
                    println("------------ INCOMES ----------")
                    for (var j=0;j<arrayCredit.count;j++)
                    {
                        print(arrayCredit[j]["merchant"] as NSString)
                        print(" : ")
                        
                        let amount = arrayCredit[j]["amount"] as Double
                        
                        println(amount/10000)
                    }
                    
                    println("")
                    
                    // println("Final amount: $\(-totalIncomes)")
                    
                    
                    println("------------ OUTCOMES ----------")
                    var finalOutcome: Double = 0
                    for (var g=0;g<arrayDebit.count;g++)
                    {
                        
                        //print(arrayDebit[g]["merchant"] as NSString)
                        //print(" : ")
                        
                        var amount = arrayDebit[g]["amount"] as Double
                        amount = -amount/10000
                     //   println(amount)
                        finalOutcome += amount
                    }
                    println("finalOutcome: \(finalOutcome)")
                    NSUserDefaults.standardUserDefaults().setDouble(finalOutcome, forKey: "creditCard")
                    NSUserDefaults.standardUserDefaults().synchronize()

                    
                    println("")
                    
                    //ArrayChecking
                    arrayDebit.removeAllObjects()
                    arrayCredit.removeAllObjects()
                    println("========= Array Checking ==========")

                    for (var i=0;i<arrayChecking.count;i++)
                    {
                        let stringDate = arrayChecking[i]["transaction-time"] as NSString
                        if stringDate.containsString("2014-09")
                        {
                            let amount = arrayChecking[i]["amount"] as Double
                            
                            if amount>0
                            {
                                arrayCredit.addObject(arrayChecking[i])
                            }
                            else
                            {
                                arrayDebit.addObject(arrayChecking[i])
                                
                            }
                        }
                        
                    }
                    
                    
                    
                    println("------------ INCOMES ----------")
                    var finalIncome: Double = 0
                    for (var j=0;j<arrayCredit.count;j++)
                    {
                        //print(arrayCredit[j]["merchant"] as NSString)
                       // print(" : ")
                        
                        var amount = arrayCredit[j]["amount"] as Double
                        
                      //  println(amount/10000)
                        amount = amount/10000
                        finalIncome += amount
                    }
                    println("Final Income: $\(finalIncome)")
                    
                    println("")
                    
                    // println("Final amount: $\(-totalIncomes)")
                    
                    
                    println("------------ OUTCOMES ----------")
                    finalOutcome = 0
                    for (var g=0;g<arrayDebit.count;g++)
                    {
                        
                      //  print(arrayDebit[g]["merchant"] as NSString)
                       // print(" : ")
                        
                        var amount = arrayDebit[g]["amount"] as Double
                        amount = -amount/10000
//                        println(-amount/10000)
                        
                        finalOutcome += amount

                    }
                    println("finalOutcome: \(finalOutcome)")
                    
                    println("")

//                    for (var i=0;i<array.count;i++)
//                    {
//                        let stringDate = array[i]["transaction-time"] as NSString
//                        if stringDate.containsString("2015-03")
//                        {
//                        let amount = array[i]["amount"] as Double
//                        
//                        if amount>0
//                        {
//                            arrayCredit.addObject(array[i])
//                        }
//                        else
//                        {
//                            arrayDebit.addObject(array[i])
//
//                        }
//                        }
//                        
//                    }
//                    
//                    
//                    
//                    println("------------ INCOMES ----------")
//                    for (var j=0;j<arrayCredit.count;j++)
//                    {
//                        print(arrayCredit[j]["merchant"] as NSString)
//                        print(" : ")
//                        
//                        let amount = arrayCredit[j]["amount"] as Double
//
//                        println(amount/10000)
//                    }
//                    
//                    println("")
//                    
//                   // println("Final amount: $\(-totalIncomes)")
//                    
//                    
//                    println("------------ OUTCOMES ----------")
//                    for (var g=0;g<arrayDebit.count;g++)
//                    {
//
//                        print(arrayDebit[g]["merchant"] as NSString)
//                        print(" : ")
//                        
//                        let amount = arrayDebit[g]["amount"] as Double
//
//                        println(-amount/10000)
//                    }
//                    
//                    println("")
//                    //println("Final amount: -$\(totalOutcomes)")
//                    
////                    println("------------ Savings ----------")
////                    println("$\(-totalIncomes-totalOutcomes) to save")
////                    println("$\((-totalIncomes-totalOutcomes)*0.2) to invest")
//                } else {
//                    // otherwise, this code is executed
//                    println(jsonError)
//                }
                
                    
                    
                
            }
            
        }
            
        }
        
        task.resume()
        
    }
    
    func getPastTransactions(urlString: String)
    {
    
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "POST"
        
        //Header
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //Body
        let dic = [
            "args": ["uid": 1110570164,
                "token": "119947F2D985C3788998543A3D3AD90C",
                "api-token": "HackathonApiToken"],
            
            "year": 2014,
            "month":9];
        
        let postString = NSJSONSerialization .dataWithJSONObject(dic, options: nil , error: nil)
        
        request.HTTPBody = postString
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error  != nil {
                println(error)
                
            } else {
                var jsonError: NSError?
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                    println(json)
                }
            }
        }
        
        task.resume()
    }
    
    func getBalance()
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.levelmoney.com/api/v2/hackathon/balances")!)
        request.HTTPMethod = "POST"
        
        //Header
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //Body
        let dic = [
            "args": [
                "uid": 1110570164,
                "token": "119947F2D985C3788998543A3D3AD90C",
                "api-token": "HackathonApiToken"]]
        
        let postString = NSJSONSerialization .dataWithJSONObject(dic, options: nil , error: nil)
        
        request.HTTPBody = postString
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error  != nil {
                println(error)
                
            } else {
                var jsonError: NSError?
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
                    // this code is executed if the json is a NSDictionary
                   // println(json)
                    let arrayDays = json["days"] as NSArray
                    let lastday = arrayDays[58] as NSDictionary
                    var balance = lastday["balance"] as Double
                    
                    println("========= Checking Balance ======== ")
                    balance = balance/10000
                    println("$\(balance)")

                    NSUserDefaults.standardUserDefaults().setDouble(balance, forKey: "checking")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                }
            }
        }
        
        task.resume()
    }
    
    }
    
