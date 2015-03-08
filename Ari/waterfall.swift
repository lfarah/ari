//
//  waterfall.swift
//  Ari
//
//  Created by Lucas Farah on 3/8/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class Waterfall: NSObject
{
    
    func wtf()
    {
        
    //Balances
    var balanceChecking: Double =  NSUserDefaults.standardUserDefaults().doubleForKey("checking")
    var balanceSavings: Double =  NSUserDefaults.standardUserDefaults().doubleForKey("savings")

    var balanceInvestments: Double = 0
    var balanceLoans: Double = 0
    
    //Accounts
    var checking: Double = 0
    var emergency: Double = 0
    var rain: Double = 0
    var investment: Double = 0
    
        var income =    NSUserDefaults.standardUserDefaults().doubleForKey("finalIncome")
    

        var pool = balanceChecking + balanceSavings + balanceInvestments + balanceLoans as Double
        var rank = 0
        var rank2 = 0
        
        if pool<=2000
        {
            rank = 1
        }
        else if pool<=5000
        {
            rank = 2
        }
        else
        {
            rank = 3
        }
        
        if income<=2000
        {
            rank2 = 1
        }
        else if income<=5000
        {
            rank2 = 2
        }
        else
        {
            rank2 = 3
        }
        
        let weight = Double(rank) * 0.2 + Double(rank2) * 0.8
        
        let weightI = Int(weight)
        
        
        //Poor
        if weightI == 1
        {
            checking = pool * 1
            emergency = pool * 0
            rain = pool * 0
            investment = 0
        }
        
        //Middle class
        else if weightI==2
        {
            checking = pool * 0.27
            emergency = pool * 0.21
            rain = pool * 0.05
            investment = pool * 0.47
        }
        //Rich
        else if weightI == 3
        {
            checking = pool * 0.17
            emergency = pool * 0.20
            rain = pool * 0.03
            investment = pool * 0.60
        }
        
        println(checking)
        println(emergency)
        println(rain)
        println(investment)
    }
}
