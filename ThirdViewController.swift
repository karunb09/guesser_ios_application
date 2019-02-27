//
//  ViewController.swift
//  Guesser
//
//  Created by Bourishetty,Karun on 2/26/19.
//  Copyright © 2019 Bourishetty,Karun. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

   
    @IBOutlet weak var minLBL: UILabel!
    @IBOutlet weak var maxLBL: UILabel!
    @IBOutlet weak var meanLBL: UILabel!
    @IBOutlet weak var sdLBL: UILabel!
    @IBAction func clearBTN(_ sender: Any) {
        minLBL.text = "\(0)"
        maxLBL.text = "\(0)"
        meanLBL.text = "\(0)"
        sdLBL.text = "\(0)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
