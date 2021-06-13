//
//
// HomeCategoryTableViewCell.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 5/29/21



import UIKit



class HomeCategoryTableViewCell: UITableViewCell {
    
    static let identifier = "HomeCategoryTableViewCell"
    @IBOutlet weak var categoryItemAppIcon: UIImageView!
    @IBOutlet weak var categoryItemAppName: UILabel!
    @IBOutlet weak var categoryItemAppDetail: UITextView!
    @IBOutlet weak var cetegoryAddButton: UIButton!
    @IBOutlet weak var homeCellSeparator: UIView!
    var index: Int = 0
    
  
    var actionCellClick: (()->Void)? = nil
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func actionAddItem(_ sender: UIButton) {
        self.actionCellClick?()
    }
    
  
}
