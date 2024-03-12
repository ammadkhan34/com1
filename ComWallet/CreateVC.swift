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
import SubstrateKeychain
import UIKit
import Substrate

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
            //sendFunds()
           // createPolkadotWallet()
        }
         
       
        collectionView.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
                // Remove back button text
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
          // Do any additional setup after loading the view.
      }
    // ... Other code ...
    func sendFunds() async {
        
        let dat: [UInt8] = [184, 122, 210, 33, 84, 52, 221, 227, 47, 93, 29, 201, 51, 199, 206, 206, 143, 102, 208, 237, 74, 85, 177, 200, 41, 189, 176, 71, 250, 4, 94, 12, 64, 161, 170, 207, 132, 24, 98, 199, 83, 129, 121, 45, 41, 182, 65, 246, 131, 123, 246, 224, 47, 13, 114, 174, 94, 119, 93, 127, 238, 36, 121, 212]
        
        let seed = Data(dat)
        do {
            
            let client = JsonRpcClient(.ws(url: URL(string: "wss://westend-rpc.polkadot.io")!,
                                           maximumMessageSize: 16*1024*1024)) // 16 Mb messages
            // Enable if you want to see rpc request logs
            // client.debug = true

            print("Initialization...")

            // Api instance for local node with Dynamic config and RPC client.
            let api = try await Api(rpc: client, config: .dynamicBlake2)

            print("=======\nTransfer Transaction\n=======")

            // Root key pair with developer test phrase
            let rootKeyPair = try Sr25519KeyPair(phrase: DEFAULT_DEV_PHRASE)

            // Derived key for Alice
          //  let from = try Sr25519KeyPair(phrase: "")
            // Derived key for Bob
          //  let bob = try rootKeyPair.derive(path: [PathComponent(string: "/Bob")])
            // Obtain address from PublicKey
            let to = try api.runtime.address(ss58: DEFAULT_DEV_ADDRESS)

            // Create transaction for balance transfer
            let call = AnyCall(name: "transfer_allow_death",
                               pallet: "Balances",
                               params: ["dest": to, "value": 0])

            // Create Submittable (transaction) from the call
            let tx = try await api.tx.new(call)
            
          //  let tx = try await api.tx.balances.transferAllowDeath(dest: to,
                                                          //        value: 15483812850)

            // Sign it and submit. Wait for success
            let events = try await tx.signSendAndWatch(signer: rootKeyPair)
                .waitForInBlock()
                .success()

//            let withdraw = try events.balances.withdraw.first
//            let success = try events.system.extrinsicSuccess.first
//
//            print("Success event: \(success!)")
//            print("Withdraw event: \(withdraw!)")

            // All events
            for event in try events.parsed() {
                print(event)
            }

            print("=======\nEnd of Transfer Transaction\n=======\n")
//            let nodeUrl = URL(string: "wss://westend-rpc.polkadot.io")!
//            
//            // Dynamic Config should work for almost all Substrate based networks.
//            // It's not most efficient though because it uses a lot of dynamic types
//            let substrate = try await Api(
//                rpc: JsonRpcClient(.ws(url: nodeUrl)),
//                config: .dynamicBlake2
//            )
//            let mnemonic = "floor spoil truly assist naive gauge dice race device absurd crater soup"
//            let from = try Sr25519KeyPair(phrase: mnemonic,wordlist: .english) // hard key derivation
//            
//            // Create recipient address from ss58 string
//            let to = try substrate.runtime.address(ss58: "5G4STBkaZ3mzcqW9NGFwcCgoCN8L1SioJ1HLHGKAZWBN1gAU")
//            
//            // Dynamic Call type with Map parameters.
//            // any ValueRepresentable type can be used as parameter
//            let call = AnyCall(name: "transfer",
//                               pallet: "Balances",
//                               params: ["dest": to, "value": 0])
//            
//            // Create Submittable (transaction) from the call
//            let tx = try await substrate.tx.new(call)
//            
//            // We are using direct signer API here
//            // Or we can set Keychain as signer in Api and provide `account` parameter
//            // `waitForFinalized()` will wait for block finalization
//            // `waitForInBlock()` will wait for inBlock status
//            // `success()` will search for failed event and throw in case of failure
//            
//            
//            
//            let events = try await tx.signSendAndWatch(signer: from)
//                .waitForFinalized()
//                .success()
//            
//            // `parsed()` will dynamically parse all extrinsic events.
//            // Check `ExtrinsicEvents` struct for more efficient search methods.
//            
//            
//            print("Events: \(try events.parsed())")
//            
//            
            
        } catch {
            // Handle any errors here
            print("Error: \(error)")
        }
    }

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
        Task { @MainActor in
            await sendFunds()
            //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //        let vc = storyboard.instantiateViewController(withIdentifier: "Send") as! Send
            //         navigationController?.pushViewController(vc,
            //         animated: true)
        }
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
