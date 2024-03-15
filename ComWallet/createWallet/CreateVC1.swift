//
//  CreateVC1.swift
//  ComWallet
//
//  Created by Muhammad Zia Shahid on 11/03/2024.
//

import UIKit
import Substrate
import SubstrateRPC
import Bip39
import CoreImage.CIFilterBuiltins
import SubstrateKeychain
import RealmSwift



class CreateVC1: UIViewController {
    let reuseIdentifier = "cell"
    var items = ["secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret","secret", "secret", "secret"]
    var phrase = [""]
    var wallet_address = ""
    static func CreateVC1() -> CreateVC1{
        let storyboard = UIStoryboard.init(name: "CreateVC1", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CreateVC1") as! CreateVC1
        return view
    }

    
    @IBOutlet weak var eyeImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mnemonicLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() 
    {
          super.viewDidLoad()
        if eyeImg != nil {
            eyeImg.isHidden = false
            mainView.alpha = 0.3
            mnemonicLabel.isHidden = false
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
            eyeImg.isUserInteractionEnabled = true
            eyeImg.addGestureRecognizer(tapGesture)
        }
         
       
        collectionView.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
                // Remove back button text
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
          // Do any additional setup after loading the view.
        
        createPolkadotWallet()
        
        
    }

    @objc func imageViewTapped() {
        // Perform transition animation here
        eyeImg.isHidden = true
        mainView.alpha = 1.0
        mnemonicLabel.isHidden = true
        items = phrase
        collectionView.reloadData()
    }
    

    @IBAction func importAction(_ sender: Any)
    {
        let wallet_addreess = WalletAddresses()
        wallet_addreess.Address = wallet_address
        wallet_addreess.mnemonic.append(objectsIn: phrase)
        print("name of dog: \(wallet_addreess.Address )" , wallet_addreess.mnemonic)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(wallet_addreess)
        }


        self.navigationController?.pushViewController(DetailsVC.DetailsVC(wallet_address: wallet_address,wallet_mnemonic: phrase), animated: true)
    }
    
}


extension CreateVC1 {
    func createPolkadotWallet() {
        guard let mnemonic = try? Mnemonic() else {
                    showAlert(message: "Error generating mnemonic phrase")
                    return
                }
        
        print("TESING???? ???? ////" , mnemonic)
        print("Mnemonic is", mnemonic.mnemonic())
        phrase = mnemonic.mnemonic()

        let seed = Data(mnemonic.substrate_seed())
                // Convert mnemonic phrase to seed
              
           do {
               // Generate a new key pair using Substrate
               let keyPair = try Sr25519KeyPair(seed: seed)
               let address = try keyPair.publicKey.ss58(format: .substrate)
               wallet_address = address
               print(address)
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




    extension CreateVC1: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
            cell.myLabel.text = items[indexPath.row]
            // Configure the cell with a rectangle and circular edges
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
               let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
               let numberofItem: CGFloat = 3
               let collectionViewWidth = self.collectionView.bounds.width
               let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
               let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
               let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
               return CGSize(width: width, height: width-30)
           }

    }





@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
        didSet {
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    func setUpView() {
        self.layer.cornerRadius = self.cornerRadiusValue
        self.clipsToBounds = true
    }
}
