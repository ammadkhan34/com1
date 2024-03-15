////
////  CreateVC.swift
////  ComWallet
////
////  Created by Ammad on 09/01/2024.
////
//
import UIKit
import Substrate
import SubstrateRPC
import Bip39
import CoreImage.CIFilterBuiltins
import SubstrateKeychain

class CreateVC: UIViewController {
    
    @IBOutlet weak var eyeImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    
    @IBOutlet weak var word1: UITextField!
    
    @IBOutlet weak var word2: UITextField!
    
    @IBOutlet weak var word3: UITextField!
    
    @IBOutlet weak var word4: UITextField!
    
    @IBOutlet weak var word5: UITextField!
    
    @IBOutlet weak var word6: UITextField!
    
    @IBOutlet weak var word7: UITextField!
    
    @IBOutlet weak var word8: UITextField!
    
    @IBOutlet weak var word9: UITextField!
    
    @IBOutlet weak var word10: UITextField!
    
    @IBOutlet weak var word11: UITextField!
    
    @IBOutlet weak var word12: UITextField!
    
    static func CreateVC() -> CreateVC{
        let storyboard = UIStoryboard.init(name: "CreateVC", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CreateVC") as! CreateVC
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if eyeImg != nil {
            eyeImg.isHidden = false
            mainView.alpha = 0.3
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
            eyeImg.isUserInteractionEnabled = true
            eyeImg.addGestureRecognizer(tapGesture)
        }
        
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
        // Remove back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func imageViewTapped() {
        // Perform transition animation here
        eyeImg.isHidden = true
        mainView.alpha = 1.0
    }
    
    @IBAction func sendVc(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Send") as! Send
        navigationController?.pushViewController(vc,animated: true)
    }
    
    @IBAction func importWallet(_ sender: Any) {
        importWallet()
        //self.navigationController?.pushViewController(DetailsVC.DetailsVC(), animated: true)
    }
    
}

extension CreateVC{
    func importWallet() {
        var mnemonic_phrase = [word1?.text, word2?.text, word3?.text, word4?.text, word5?.text, word6?.text, word7?.text, word8?.text, word9?.text, word10?.text, word11?.text, word12?.text].compactMap { $0 ?? "" }


       do {
           let seed = Data(try Mnemonic(mnemonic: mnemonic_phrase, wordlist: .english).substrate_seed())
           // Generate a new key pair using Substrate
           let keyPair = try Sr25519KeyPair(seed: seed)
           let address = try keyPair.publicKey.ss58(format: .substrate)
         print(address)
           self.navigationController?.pushViewController(DetailsVC.DetailsVC(wallet_address: address, wallet_mnemonic: mnemonic_phrase), animated: true)
           showAlert(message: "Your Polkadot wallet address is \(address)")
       } catch {
           // Handle error
           print("Error creating Polkadot wallet: \(error.localizedDescription)")
           showAlert(message: "Error creating Polkadot wallet. Please try again.")
       }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Polkadot Wallet Created", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
