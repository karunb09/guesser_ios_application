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
        Guesser.shared.clearStatistics()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        statistics()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        statistics()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func statistics(){
        minLBL.text = String(Guesser.shared.maximumAttempts())
        
        maxLBL.text = String(Guesser.shared.maximumAttempts())
        var count = 0
        for i in 0..<Guesser.shared.numOfGuesses(){
            count += Guesser.shared.guess(index: i).numAttemptsRequired
        }
        let mean = Double(count)/Double(Guesser.shared.numOfGuesses())
        if mean.isNaN{
            meanLBL.text = "0.0"
        }
        else{
        meanLBL.text = "\(mean)"
        }
        var sdsum = 0.0
        for i in 0..<Guesser.shared.numOfGuesses(){
            sdsum += pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - mean, 2)
        }
        let result = sdsum/Double(Guesser.shared.numOfGuesses())
        //sdLBL.text = "\(sdsum/Double(Guesser.shared.numOfGuesses()))"
        if result.isNaN{
            sdLBL.text = "0.0"
        }
        else{
            sdLBL.text = "\(result)"
        }
    }
}
