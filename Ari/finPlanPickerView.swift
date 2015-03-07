//
//  finPlanPickerView.swift
//  Ari
//
//  Created by Lucas Farah on 3/7/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class finPlanPickerView: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var percentage = 0;

    @IBOutlet weak var lblAmountInvested: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting title
        self.title = "Financial Plan"
    }
    
    //MARK: Tableview Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = self.tableview.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        if indexPath.row == 0
        {
            cell.textLabel?.text = "1. 50% - users who want a better description"
            
        }
        else if indexPath.row == 1
        {
            cell.textLabel?.text = "2. 30% - users who want a medium description"
        }
        else
        {
            cell.textLabel?.text = "3. 10% - users who want a shitty description"
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
        
        println("selected row: \(indexPath.row)")
        
        if indexPath.row == 0
        {
           percentage = 50
            self.lblAmountInvested.text = "$\(1000)"
        }
        else if indexPath.row == 1
        {
            percentage = 30
            self.lblAmountInvested.text = "$\(500)"

        }
        else
        {
            percentage = 10
            self.lblAmountInvested.text = "$\(100)"

        }
        
    }

    //MARK: Buttons
    @IBAction func butContinuePressed(sender: AnyObject)
    {
        self.savePercentage()
        
        self.performSegueWithIdentifier("pushContinue", sender: self)
    }
    
    //MARK: Other Functions
    func savePercentage()
    {
        NSUserDefaults.standardUserDefaults().setObject(percentage, forKey: "financialPlan")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

