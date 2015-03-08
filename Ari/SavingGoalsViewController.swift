//
//  SavingGoalsViewController.swift
//  Ari
//
//  Created by Lucas Farah on 3/8/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class SavingGoalsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrayTxt = ["Pay off student loan","Car","Big trip","House","Marriage","Children"]

    @IBOutlet weak var tableview: UITableView!
    
       override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Saving for next 5 years"
        
        let pc: LevelMoney = LevelMoney()
        pc.getEverything()
        pc.getBalance()
        
        let vc: Plaid = Plaid()
        vc.getTransactionData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Tableview functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    let cell: SavingGoalsCell = self.tableview.dequeueReusableCellWithIdentifier("cell") as SavingGoalsCell
    cell.lbl.text = arrayTxt[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: SavingGoalsCell = self.tableview.cellForRowAtIndexPath(indexPath) as SavingGoalsCell
        
        if cell.imgvTic.image == UIImage(named: "Tick-mark-icon-png-6619 2.png")
        {
            cell.imgvTic.image = UIImage()
        }
        else
        {
            cell.imgvTic.image = UIImage(named: "Tick-mark-icon-png-6619 2.png")

        }
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
