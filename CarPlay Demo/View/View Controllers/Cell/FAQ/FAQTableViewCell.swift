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
    
    var isExpand: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(checkAction))
        self.viewIcon.addGestureRecognizer(gesture)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        //rotationAnimation.toValue = M_PI
        rotationAnimation.duration = 1.0

        self.viewIcon.layer.add(rotationAnimation, forKey: nil)
    }
    
    func setviewVisibility(isExpand: Bool){
    
    }
    
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi/2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
