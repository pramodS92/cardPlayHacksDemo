//
//
// AppInstalationViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 5/30/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class AppInstalationViewController: UIViewController {
    static let segue = "appSegue"
    
    @IBOutlet weak var findJailBreakToolsButton: UIButton!
    @IBOutlet weak var cardViewTitleLabel: UITextView!
    @IBOutlet weak var deviceTypeLabel: UILabel!
    @IBOutlet weak var deviceIOSVersionLabel: UILabel!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var instructionLabel: UITextView!
    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    
    let isJailbreak: Bool = true
    var appName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUiProps()
    }
    
    func setupUiProps() {
        self.findJailBreakToolsButton.layer.cornerRadius = 10
        self.appTitleLabel.text = "Install " + appName!
        
        if isJailbreak {
            self.buttonImageView.isHidden = true
            self.cardImageView.image = UIImage(named: "card_green")
            self.cardViewTitleLabel.text = "Hurry, We found jailbreak Tools for"
            self.findJailBreakToolsButton.setTitle("Find Available Jailbreak Tools", for: .normal)
        }else{
            self.buttonImageView.isHidden = false
            self.cardImageView.image = UIImage(named: "card_red")
            self.cardViewTitleLabel.text = "We could not find any jailbreak Tools for"
            findJailBreakToolsButton.setTitle("Install incar for FREE", for: .normal)
        }
    }
    
    
    func findJailbreakTools(){
        if isJailbreak {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "JailBreakViewController") as! JailBreakViewController
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }else{
            
        }
    }
    
    @IBAction func actionFindJailBrakTool(_ sender: Any) {
        self.findJailbreakTools()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

