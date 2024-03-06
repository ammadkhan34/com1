//
//  TransactionCell.swift
//  ComWallet
//
//  Created by Ammad on 05/03/2024.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet weak var comAmount: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
   
    @IBOutlet weak var comPrice: UILabel!
    @IBOutlet weak var methodType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
