//
//
// AlertViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/4/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerButtonHolderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        self.containerView.roundCorners(corners: [.bottomLeft, .bottomRight,.topLeft,.topRight], radius: 15)
        self.containerButtonHolderView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15)
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.navigateToHome()
    }
    
    func navigateToHome() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserGuideViewController") as! UserGuideViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
