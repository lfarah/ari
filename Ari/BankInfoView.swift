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
        
        let vc: Plaid = Plaid()
//     vc.getTransactionData()
        
        let cv: MagicSauce = MagicSauce()
        //cv.authMagicSauce()

        let pc: LevelMoney = LevelMoney()
//        pc.getEverything()
//        pc.getBalance()
        
        let xi = Xignite()
        
//        let arrayStocks = ["AAPL","GOOG","GE","JNJ","MSFT","XOM"]
//        for value in arrayStocks
//        {            
            xi.getCurrentPriceForStock("GOOG")
//        }
        
    }

    @IBAction func butContinueSelected(sender: AnyObject)
    {
        self.performSegueWithIdentifier("nextPushed", sender: self)
    }


}
