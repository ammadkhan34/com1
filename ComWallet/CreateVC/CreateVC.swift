////
////  CreateVC.swift
////  ComWallet
////
////  Created by Ammad on 09/01/2024.
////
//
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
    var items = ["secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret"]
    
    @IBOutlet weak var eyeImg: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mnemonicLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    
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
      }
    // ... Other code ...

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
//        eyeImg.isHidden = false
//        mainView.alpha = 0.3
//        mnemonicLabel.isHidden = false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReceiveVc") as! ReceiveVc
         navigationController?.pushViewController(vc,
         animated: true)
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
            cell.myLabel.text = "secret"
            cell.myLabel.textColor = UIColor.lightGray
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
