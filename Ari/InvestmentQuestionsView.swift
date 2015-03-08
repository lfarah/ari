//
//  InvestmentQuestionsView.swift
//  Ari
//
//  Created by Lucas Farah on 3/7/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class InvestmentQuestionsView: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setting the title
        self.title = "Investment Questions"
    }
    
    
    //MARK: Tableview Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: InvestmentQuestionsCell = self.tableview.dequeueReusableCellWithIdentifier("cell2") as InvestmentQuestionsCell
        
        if indexPath.row == 0
        {
          cell.txtInput.placeholder = "Employment"
        }
        else if indexPath.row == 1
        {
            cell.txtInput.placeholder = "Net Worth"
        }
        else if indexPath.row == 2
        {
            cell.txtInput.placeholder = "Timeframe"
        }
        else if indexPath.row == 3
        {
            cell.txtInput.placeholder = "Reason to Invest"
        }
        else
        {
            cell.txtInput.placeholder = "Yearly Income"
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
        
        println("selected row: \(indexPath.row)")
        
//        if indexPath.row == 0
//        {
//            percentage = 50
//            self.lblAmountInvested.text = "$\(1000)"
//        }
//        else if indexPath.row == 1
//        {
//            percentage = 30
//            self.lblAmountInvested.text = "$\(500)"
//            
//        }
//        else
//        {
//            percentage = 10
//            self.lblAmountInvested.text = "$\(100)"
//            
//        }
        
    }
}
