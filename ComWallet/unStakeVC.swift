//
//  unStakeVC.swift
//  ComWallet
//
//  Created by Ammad on 10/02/2024.
//

import UIKit

class unStakeVC: UIViewController {

    @IBOutlet weak var stakeBalanceText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text1 = "Staked balance: 10 COM"
        
        // Create an attributed string
        let attributedString1 = NSMutableAttributedString(string: text1)
        
        // Find the range of the specific word
        let wordToHighlight1 = "10 COM"
        let range1 = (text1 as NSString).range(of: wordToHighlight1)
        
        // Apply red color to the specific word
        attributedString1.addAttribute(.foregroundColor, value: UIColor.white, range: range1)
        
        stakeBalanceText.attributedText = attributedString1
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func validationVC(_ sender: Any) {
       // validatorVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "validatorVC") as! validatorVC
         navigationController?.pushViewController(vc,
         animated: true)
    }
}
