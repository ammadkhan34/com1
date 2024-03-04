//
//  stakeVC.swift
//  ComWallet
//
//  Created by Ammad on 10/02/2024.
//

import UIKit

class stakeVC: UIViewController {

    @IBOutlet weak var stakeText: UILabel!
   
    @IBOutlet weak var stakeBalanceText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "Stake your COMs and enjoy a current annual percentage yield (APY) of 50%"
        
        // Create an attributed string
        let attributedString = NSMutableAttributedString(string: text)
        
        // Find the range of the specific word
        let wordToHighlight = "50%"
        let range = (text as NSString).range(of: wordToHighlight)
        
        // Apply red color to the specific word
       
        attributedString.addAttribute(.foregroundColor, value:  UIColor(red: 0.98, green: 0, blue: 0.35, alpha: 1), range: range)
        
        stakeText.attributedText = attributedString
        
        let text1 = "Staked balance: 10 COM"
        
        // Create an attributed string
        let attributedString1 = NSMutableAttributedString(string: text1)
        
        // Find the range of the specific word
        let wordToHighlight1 = "10 COM"
        let range1 = (text1 as NSString).range(of: wordToHighlight1)
        
        // Apply red color to the specific word
        attributedString1.addAttribute(.foregroundColor, value: UIColor.white, range: range1)
        
        stakeBalanceText.attributedText = attributedString1
        
    }
    
    @IBAction func unstake(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "unStakeVC") as! unStakeVC
         navigationController?.pushViewController(vc,
         animated: true)
    }
    
}
