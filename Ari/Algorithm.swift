//
//  ViewController.swift
//  algoirthm
//
//  Created by Simone Totaro on 08/03/15.
//  Copyright (c) 2015 Simone Totaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var income:Float = 2000
        var expenses:Float = 1500
        
        var delta:Float = income - expenses
        
        var checking:Float = 0
        var emergency:Float = 0
        var rain:Float = 0
        var investment:Float = 0
        var test = false
        var count = 0
        while (test == false) {
        if checking < (income*2) {
        
        checking = checking + delta
        count++
        println("this is your checking \(checking)")
        } else if emergency < (income*3) {
        
            emergency = emergency + delta
            count++

            println("this is your emergency \(emergency)")
        
        } else {
        
            while (emergency < (income*6)) {
            
                emergency = emergency + (delta*0.5) // delta should be *0.5
                rain = rain + (delta*0.5) // delta should be *0.5
                count++

                println("this is half emergency \(emergency)")
                println("this is half of rain \(rain)")
            }
            
            rain = rain + delta
            count++
            println("this is the number of months wait\(count)")
            test = true
            println("this is all rain\(rain)")

        }
        }
        
        income = 5000
        expenses = 3000
        checking = 0
        emergency = 0
        rain = 0
        investment = 0
        test = false
        count = 0
        var l = false
        var lValue:Float = 0
        
        
        while (test == false) {
            if checking < (income*2) {
                
                checking = checking + delta
                count++
                println("this is your checking \(checking)")
            } else if emergency < (income*4) {
                
                emergency = emergency + delta
                count++

                println("this is your emergency \(emergency)")
                
            } else {
                
                if lValue != 0 {
                
                l = true
                
                }
                
                if l == false {
                    while (rain < (income*2)) {
                
                rain = rain + delta*0.2
                count++

                println("this is all rain\(rain)")
                
                investment = investment + delta*0.8
                        count++

                println("this is all investment under no Expenses\(investment)")


                    }
                investment = investment + delta
                    count++
                println("this is the number of months wait\(count)")

                println("this is all investment under no Expenses  & rain \(investment)")
                test = true

                
                } else {
                
                    while (rain < (2*income + lValue)) {
                rain = rain + delta*0.8
                investment = investment + delta*0.2
                        count++


                println("this is all rain\(rain)")
                println("this is all investment under Expenses\(investment)")

                    
                }
                    investment = investment + delta
                    count++
                    println("this is the number of months wait\(count)")

                    println("this is all investment under no Expenses  & rain \(investment)")
                    test = true
            }
                
            }
        }
        income = 10000
        expenses = 60000
        checking = 0
        emergency = 0
        rain = 0
        investment = 0
        test = false
        l = false
        lValue = 0
        count = 0
        
        
        while (test == false) {
            if checking < (income*2) {
                
                checking = checking + delta
                count++
                println("this is your checking \(checking)")
            } else if emergency < (income*6) {
                count++
                emergency = emergency + delta
                println("this is your emergency \(emergency)")
                
            } else {
                
                if lValue != 0 {
                    
                    l = true
                    
                }
                
                if l == false {
                    while (rain < (income*2)) {
                        count++
                        rain = rain + delta*0.2
                        println("this is all rain\(rain)")
                        
                        investment = investment + delta*0.8
                        println("this is all investment under no Expenses\(investment)")
                        
                        
                    }
                    count++
                    investment = investment + delta
                    println("this is all investment under no Expenses  & rain \(investment)")
                    println("this is the number of months wait\(count)")

                    test = true
                    
                    
                } else {
                    
                    while (rain < (2*income + lValue)) {
                        rain = rain + delta*0.6
                        investment = investment + delta*0.4
                        count++
                        println("this is all rain\(rain)")
                        println("this is all investment under Expenses\(investment)")
                        
                        
                    }
                    count++
                    investment = investment + delta
                    println("this is all investment under no Expenses  & rain \(investment)")
                    println("this is the number of months wait\(count)")

                    test = true
                }
                
            }
        }
        
        income = 2000

        checking = 1000
        emergency = 5000
        rain = 0
        investment = 0
        
        var p:Float = 3
        
        if income < 5000 && income > 2000 {
            p = 4
         
        } else  if income > 5000 {
        
        p = 6
        
        }
        var fall = false
        
        while (fall == false) {
        if checking < income {
        
        checking = checking + income
        
        } else if emergency < income*p {
        
        emergency = emergency + income
        
        
        } else if rain < income {
        
        rain = rain + income
        
        } else {
        
        investment = checking - income
        checking = income
        fall = true
        
        }
        println("this is your checking \(checking)")
        println("this is your emergency \(emergency)")
        println("this is your rain \(rain)")
        println("this is your investment \(investment)")

        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

