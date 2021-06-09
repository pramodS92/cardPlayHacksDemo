//
//
// PaymentsTableViewCell.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/3/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class PaymentsTableViewCell: UITableViewCell {
    static let identifier = "PaymentsTableViewCell"
    
    @IBOutlet weak var paymentOptionIcon: UIImageView!
    @IBOutlet weak var paymentOptionName: UILabel!
    @IBOutlet weak var paymentOptionCOntinueButton: UIButton!
    
    var actionContinue: (()->Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.paymentOptionCOntinueButton.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.actionContinue?()
    }
    
}
