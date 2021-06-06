//
//
// ViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 5/27/21



import UIKit

class WelcomeSplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navigateToHome()
        }
    }
    
    
    func navigateToHome() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: UIConstants.ViewControllerId.HOME_VIEW_CONTROL_ID) as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

