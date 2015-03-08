//
//  ProfileViewController.swift
//  Ari
//
//  Created by Lucas Farah on 3/8/15.
//  Copyright (c) 2015 Lucas Farah. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var p1: UILabel!
    
    @IBOutlet weak var p2: UILabel!
    
    @IBOutlet weak var p3: UILabel!
    
    @IBOutlet weak var p4: UILabel!
    
    @IBOutlet weak var p5: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ms = MagicSauce()
        ms.profileMagicSauceFixed()
        
        // Do any additional setup after loading the view.
        
        let opennes = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Openness")
        let neuroticism =  NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Neuroticism")
        let conscientiousness = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Conscientiousness")
        let agreeableness = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Agreeableness")
        let extraversion = NSUserDefaults.standardUserDefaults().doubleForKey("BIG5_Extraversion")
        
        let i = Int(opennes*100)
        let j = Int(neuroticism*100)
        let p = Int(conscientiousness*100)
        let q = Int(agreeableness*100)
        let a = Int(extraversion*100)

        p1.text = ("\(i)")
        p2.text = ("\(j)")
        p3.text = ("\(p)")
        p4.text = ("\(q)")
        p5.text = ("\(a)")


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
