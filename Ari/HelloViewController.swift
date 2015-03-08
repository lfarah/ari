//
//  HelloViewController.swift
//  Ari
//
//  Created by Lucas Farah on 3/8/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("next"), userInfo: nil, repeats: false)
        
    }
    
    func next()
    {
        self.performSegueWithIdentifier("next", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
