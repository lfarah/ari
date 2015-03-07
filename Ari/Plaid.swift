//
//  Plaid.swift
//  Ari
//
//  Created by Simone Totaro on 07/03/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import Foundation


//  CLEAN CODE AND IMPLEMENT LOGIN

func getCategories() {
    
    let url = NSURL(string: "https://tartan.plaid.com/categories")
    let request = NSURLRequest(URL: url!)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
        if error != nil {
            
            println(error)
            
            
        } else {
            var jsonError:NSError?
            var jsonOptional:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
            
            println(jsonOptional)
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
            
            var jsonError:NSError?
            let jsonOptional: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
            
            println(jsonOptional)
            
        }
        
    }
    
    task.resume()
    
}

func getTransactionData() {
    
    let request = NSMutableURLRequest(URL: NSURL(string: "https://tartan.plaid.com/connect/get")!)
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