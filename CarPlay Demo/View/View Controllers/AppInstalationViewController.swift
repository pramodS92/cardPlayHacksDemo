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
            
            let text = "Hurray, We found jailbreak tools for".withBoldText(textArray: ["jailbreak tools"],fontSize: 27.0)
            self.cardViewTitleLabel.attributedText = text
           
            let _instruction = "Go ahead and complete the next few steps to get your all favorite apps including " +  appName! + " on carplay"
            self.instructionLabel.attributedText =  _instruction.withBoldText(textArray: [appName!],fontSize: 16.0)
    
              
            self.findJailBreakToolsButton.setTitle("Find Available Jailbreak Tools", for: .normal)
        }else{
            self.buttonImageView.isHidden = false
            self.cardImageView.image = UIImage(named: "card_red")
            
            let text = "We could not find any jailbreak tools for".withBoldText(textArray: ["jailbreak tools"],fontSize: 27.0)
            self.cardViewTitleLabel.attributedText = text
            
            let _instruction = "This is not the end of story, you can use " +  appName! + " on Carplay UI using the app below "
            self.instructionLabel.attributedText =  _instruction.withBoldText(textArray: [appName!],fontSize: 16.0)

            findJailBreakToolsButton.setTitle("Install incar for FREE", for: .normal)
        }
        
        self.cardViewTitleLabel.textAlignment = .center
        self.instructionLabel.textAlignment = .left
        self.cardViewTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.instructionLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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

extension AppInstalationViewController {
    
    func makeTextBold(boldText: String, fontSize: CGFloat) -> NSMutableAttributedString{
        let boldText = boldText
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalString = NSMutableAttributedString(string:"")
        
        attributedString.append(normalString)
        return attributedString
    }
}

extension String {
    func withBoldText(textArray: [String], font: UIFont? = nil,fontSize: CGFloat) -> NSAttributedString {
        
  let _font = font ?? UIFont.systemFont(ofSize: fontSize, weight: .light)
  let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
  let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        
        for element in textArray {
            let range = (self as NSString).range(of: element)
            fullString.addAttributes(boldFontAttribute, range: range)
        }
         
 
  return fullString
}}


