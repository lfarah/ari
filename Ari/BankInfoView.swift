//
//  BankInfoView.swift
//  Ari
//
//  Created by Lucas Farah on 3/7/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class BankInfoView: UIViewController {

    @IBOutlet weak var lblNetMoney: UILabel!
    @IBOutlet weak var lblAvgMonthMoney: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Banking
        let vc: Plaid = Plaid()
        vc.getTransactionData()
        
        let pc: LevelMoney = LevelMoney()
        pc.getEverything()
        pc.getBalance()

        
        //Cyclometric Analysis
        let cv: MagicSauce = MagicSauce()
        cv.authMagicSauce()
        
        
        
        let xi = Xignite()
        xi.getCurrentPriceForStock("GOOG")

//        let arrayStocks = ["AAPL","GOOG","GE","JNJ","MSFT","XOM"]
//        for value in arrayStocks
//        {            
//        }
        
    }




}
