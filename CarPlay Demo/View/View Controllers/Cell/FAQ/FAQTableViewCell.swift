//
//
// FAQTableViewCell.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/5/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class FAQTableViewCell: UITableViewCell {
    static let identifier = "FAQTableViewCell"

    @IBOutlet weak var viewIcon: UIView!
    @IBOutlet weak var titleFAQ: UILabel!
    @IBOutlet weak var textFieldFAQ: UITextView!
    @IBOutlet weak var titleViewHolder: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var isExpand: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {

    }
    
    func setviewVisibility(isExpand: Bool){
    
    }
    
}



