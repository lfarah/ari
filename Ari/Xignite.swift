//
//  Xignite.swift
//  Ari
//
//  Created by Lucas Farah on 3/7/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class Xignite: NSObject
{
    var priceToday_1:Double = 0
    var price30_1:Double = 0
    var moneySpent_1:Double = 0
    
    var priceToday_2:Double = 0
    var price30_2:Double = 0
    var moneySpent_2:Double = 0

    
    func getCurrentPriceForStock(stock: NSString)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://globalquotes.xignite.com/v3/xGlobalQuotes.json/GetGlobalDelayedQuote?")!)
        request.HTTPMethod = "POST"
        let postString = "IdentifierType=Symbol&Identifier=\(stock)&_Token=E208B2F5497C4880B593EBFC90856142"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
//        request.setValue("globalquotes.xignite.com", forHTTPHeaderField: "Host")
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.setValue("length", forHTTPHeaderField: "Content-Length")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error  != nil {
                println(error)
                
            }
            else
            {
                var jsonError: NSError?
                let string = NSString(data: data, encoding: NSUTF8StringEncoding) as String
                let array = string.componentsSeparatedByString(",")
                let array2 = array[8].componentsSeparatedByString(":")
                println("value today: \(array2[1])")
                let stringPrice = array2[1] as NSString
                self.priceToday_1 = stringPrice.doubleValue
                
  
                //30 days
                self.get30DaysAgoPriceForStock(stock)
            }
            
        }
        
        task.resume()
        

    }
    
    func get30DaysAgoPriceForStock(stock: NSString)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://www.xignite.com/xGlobalHistorical.json/GetEndOfDayQuote?")!)
        request.HTTPMethod = "POST"
        let postString = "IdentifierType=Symbol&Identifier=\(stock)&AdjustmentMethod=SplitOnly&EndOfDayPriceMethod=LastTrade&AsOfDate=02/6/2015&_Token=E208B2F5497C4880B593EBFC90856142"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error  != nil {
                println(error)
                
            }
            else
            {
                var jsonError: NSError?
                let string = NSString(data: data, encoding: NSUTF8StringEncoding) as String
                let array = string.componentsSeparatedByString(",")
                let array2 = array[13].componentsSeparatedByString(":")
                println("value 30 days ago: \(array2[1])")
                let stringPrice = array2[1] as NSString
                self.price30_1 = stringPrice.doubleValue
                
               println(self.formula())
            }
        }
        
        task.resume()
    }
    
    func formula() -> Double
    {
        let sum = (self.priceToday_1 / self.price30_1)-1
        return sum
    }


}
