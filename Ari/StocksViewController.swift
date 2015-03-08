//
//  StocksViewController.swift
//  Ari
//
//  Created by Lucas Farah on 3/8/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    
    @IBOutlet weak var p1: UILabel!
    @IBOutlet weak var p2: UILabel!
    @IBOutlet weak var p3: UILabel!
    @IBOutlet weak var p4: UILabel!
    @IBOutlet weak var p5: UILabel!
    @IBOutlet weak var p6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let arrayStocks = ["AAPL","GOOG","GE","JNJ","MSFT","XOM"]

        self.getCurrentPriceForStock1(arrayStocks[0] as NSString)
        self.getCurrentPriceForStock2(arrayStocks[1] as NSString)
        self.getCurrentPriceForStock3(arrayStocks[2] as NSString)
        self.getCurrentPriceForStock4(arrayStocks[3] as NSString)
        self.getCurrentPriceForStock5(arrayStocks[4] as NSString)
        self.getCurrentPriceForStock6(arrayStocks[5] as NSString)

        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray )
        self.view.addSubview(activity)
        
        activity.startAnimating()
            }

    //1
    var priceToday_1:Double = 0
    var price30_1:Double = 0
    var moneySpent_1:Double = 0
    
    var priceToday_2:Double = 0
    var price30_2:Double = 0
    var moneySpent_2:Double = 0
    
    var priceToday_3:Double = 0
    var price30_3:Double = 0
    var moneySpent_3:Double = 0
    
    var priceToday_4:Double = 0
    var price30_4:Double = 0
    var moneySpent_4:Double = 0
    
    var priceToday_5:Double = 0
    var price30_5:Double = 0
    var moneySpent_5:Double = 0
    
    var priceToday_6:Double = 0
    var price30_6:Double = 0
    var moneySpent_6:Double = 0
    
    
    func getCurrentPriceForStock1(stock: NSString)
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
                self.get30DaysAgoPriceForStock1(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock1(stock: NSString)
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
                
                let string1 = NSString(format: "%.2f %@",self.formula1(),"%")
                self.p1.text = string1
                println("stock1 = \(self.formula1())%")
            }
        }
        
        task.resume()
    }
    
    func formula1() -> Double
    {
        let sum = (self.priceToday_1 / self.price30_1)-1
        return sum
    }
    
    //2
    
    func getCurrentPriceForStock2(stock: NSString)
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
                self.priceToday_2 = stringPrice.doubleValue
                
                
                //30 days
                self.get30DaysAgoPriceForStock2(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock2(stock: NSString)
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
                self.price30_2 = stringPrice.doubleValue
                
                let string2 = NSString(format: "%.2f %@",self.formula2(),"%")
                self.p2.text = string2
                println("stock2 = \(self.formula2())%")

            }
        }
        
        task.resume()
    }
    
    func formula2() -> Double
    {
        let sum = (self.priceToday_2 / self.price30_2)-1
        return sum
    }
    
    //3
    func getCurrentPriceForStock3(stock: NSString)
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
                self.priceToday_3 = stringPrice.doubleValue
                
                
                //30 days
                self.get30DaysAgoPriceForStock3(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock3(stock: NSString)
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
                self.price30_3 = stringPrice.doubleValue
                
                let string3 = NSString(format: "%.2f %@",self.formula3(),"%")
                self.p3.text = string3
                println("stock3 = \(self.formula3())%")

            }
        }
        
        task.resume()
    }
    
    func formula3() -> Double
    {
        let sum = (self.priceToday_3 / self.price30_3)-1
        return sum
    }
    
    //4
    
    func getCurrentPriceForStock4(stock: NSString)
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
                self.priceToday_4 = stringPrice.doubleValue
                
                
                //30 days
                self.get30DaysAgoPriceForStock4(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock4(stock: NSString)
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
                self.price30_4 = stringPrice.doubleValue
                
                let string4 = NSString(format: "%.2f %@",self.formula4(),"%")
                self.p4.text = string4
                println("stock4 = \(self.formula4())%")

            }
        }
        
        task.resume()
    }
    
    func formula4() -> Double
    {
        let sum = (self.priceToday_4 / self.price30_4)-1
        return sum
    }
    
    //5

    func getCurrentPriceForStock5(stock: NSString)
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
                self.priceToday_5 = stringPrice.doubleValue
                
                
                //30 days
                self.get30DaysAgoPriceForStock5(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock5(stock: NSString)
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
                self.price30_5 = stringPrice.doubleValue
                
                let string5 = NSString(format: "%.3f %@",self.formula5(),"%")
                self.p5.text = string5
                println("stock5 = \(self.formula5())%")

            }
        }
        
        task.resume()
    }
    
    func formula5() -> Double
    {
        let sum = (self.priceToday_5 / self.price30_5)-1
        return sum
    }

    //6
    func getCurrentPriceForStock6(stock: NSString)
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
                self.priceToday_6 = stringPrice.doubleValue
                
                
                //30 days
                self.get30DaysAgoPriceForStock6(stock)
            }
            
        }
        
        task.resume()
        
        
    }
    
    func get30DaysAgoPriceForStock6(stock: NSString)
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
                self.price30_6 = stringPrice.doubleValue
                
                let string6 = NSString(format: "%.2f %@",self.formula6(),"%")
                self.p6.text = string6
                println("stock6 = \(self.formula6())%")

            }
        }
        
        task.resume()
    }
    
    func formula6() -> Double
    {
        let sum = (self.priceToday_6 / self.price30_6)-1
        return sum
    }

    

}
