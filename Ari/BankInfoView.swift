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
       vc.getTransactionData()
        
        let cv: MagicSauce = MagicSauce()
//        cv.authMagicSauce()
        
        let pc: LevelMoney = LevelMoney()
        pc.getEverything()
        pc.getBalance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func butContinueSelected(sender: AnyObject)
    {
        self.performSegueWithIdentifier("nextPushed", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
