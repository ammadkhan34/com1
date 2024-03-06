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
import UIKit
//
//class CreateVC: UIViewController {
//    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
//       var items = ["secret","secret","secret","secret","secret","secret","secret","secret","secret" ]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//extension CreateVC: UICollectionViewDelegate,UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionCell
//
//               // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.row] // The row value is the same as the index of the desired text within the array.
//               cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 8
//               return cell
//    }
//}
class CreateVC: UIViewController {
    let reuseIdentifier = "cell"
    var items = ["secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret","secret", "secret", "secret"]
    
    @IBOutlet weak var eyeImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mnemonicLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
          super.viewDidLoad()
        if eyeImg != nil {
            eyeImg.isHidden = false
            mainView.alpha = 0.3
            mnemonicLabel.isHidden = false
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
            eyeImg.isUserInteractionEnabled = true
            eyeImg.addGestureRecognizer(tapGesture)
        }
        else {
            createPolkadotWallet()
        }
         
       
        collectionView.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
                // Remove back button text
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
          // Do any additional setup after loading the view.
      }
    // ... Other code ...

    func createPolkadotWallet() {
       // importWallet(<#T##Any#>)
        guard let mnemonic = try? Mnemonic() else {
                   // showAlert(message: "Error generating mnemonic phrase")
                    return
                }
        
        
        print("Mnemonic is", mnemonic.mnemonic())
      
var i = 0
        // Now you can replace each word with something else if needed
        var modifiedMnemonicWords = mnemonic.mnemonic().map { word in
            // Replace each word with something else
           items[i] = word
            i += 1
        }
        
        let seed = Data(mnemonic.substrate_seed())
                // Convert mnemonic phrase to seed
              
           do {
               // Generate a new key pair using Substrate
               let keyPair = try Sr25519KeyPair(seed: seed)
               let address = try keyPair.publicKey.ss58(format: .substrate)
             print(address)
               collectionView.reloadData()
              // showAlert(message: "Your Polkadot wallet address is \(address)")
           } catch {
               // Handle error
               print("Error creating Polkadot wallet: \(error.localizedDescription)")
              // showAlert(message: "Error creating Polkadot wallet. Please try again.")
           }
       }
    
    
    @objc func imageViewTapped() {
        // Perform transition animation here
        eyeImg.isHidden = true
        mainView.alpha = 1.0
        mnemonicLabel.isHidden = true
    }
    @IBAction func sendVc(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Send") as! Send
         navigationController?.pushViewController(vc,
         animated: true)
    }
    
    @IBAction func importAction(_ sender: Any) {
        var wordsList : [String] = []
        for i in 0...11 {
            let indexPath: IndexPath = IndexPath(row: i, section: 0)
            let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
            wordsList.append(cell.collectionTextField.text ?? "")
            print(cell.collectionTextField.text)
        }
        importWallet(wordsList)
        
//        eyeImg.isHidden = false
//        mainView.alpha = 0.3
//        mnemonicLabel.isHidden = false
        
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ReceiveVc") as! ReceiveVc
//         navigationController?.pushViewController(vc,
//         animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func importWallet(_ wordsList: [String]) {
       // importWallet(<#T##Any#>)
    
        
        
      //  print("Mnemonic is", mnemonic.mnemonic())
        
        //let seed = Data(mnemonic.substrate_seed())
                // Convert mnemonic phrase to seed
              
           do {
               
               let seed = Data(try Mnemonic(mnemonic: wordsList
//                                                ["siege", "argue", "shell", "flavor", "ranch", "staff", "reform", "trust", "ramp", "differ", "enrich", "destroy"]
                                            , wordlist: .english).substrate_seed())
               // Generate a new key pair using Substrate
               let keyPair = try Sr25519KeyPair(seed: seed)
               let address = try keyPair.publicKey.ss58(format: .substrate)
             print(address)
               
           //   showAlert(message: "Your Polkadot wallet imported and address is \(address)")
                       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let vc = storyboard.instantiateViewController(withIdentifier: "ReceiveVc") as! ReceiveVc
              vc.setQRText(address)
                        navigationController?.pushViewController(vc,
                        animated: true)
           } catch {
               // Handle error
               print("Error creating Polkadot wallet: \(error.localizedDescription)")
               showAlert(message: "Error importing Polkadot wallet. Please try again.")
           }
       }
       
    
    // Function to calculate the item size based on the collection view width and the number of items per row
    private func calculateItemSize() -> CGSize {
            if let collectionView = collectionView {
                let spacing: CGFloat = 10
                let itemsPerRow: CGFloat = 3
                let totalSpacing = (itemsPerRow - 1) * spacing
                let availableWidth = collectionView.frame.width - totalSpacing
                let width = (availableWidth / itemsPerRow)*1.8
                let height = width/5 // You can adjust the height as needed

                return CGSize(width: width/2, height: height)
            } else {
                return CGSize(width: 0, height: 0)
            }
        }
    }

    extension CreateVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
            if eyeImg != nil {
              //  cell.myLabel.text = items[indexPath.row]
                cell.collectionTextField.textColor = UIColor.lightGray
            }
            else {
                cell.myLabel.text = items[indexPath.row]
                cell.myLabel.textColor = UIColor.lightGray
            }
            // Configure the cell with a rectangle and circular edges
            cell.backgroundColor = UIColor.white
            cell.layer.cornerRadius = 20 // Adjust the corner radius to make it circular
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1

            return cell
        }

        // Function to calculate the item size based on the collection view width and the number of items per row
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return calculateItemSize()
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
