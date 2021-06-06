//
//
// HomeViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 5/27/21



import UIKit


enum Category: Int {
    case entertainment = 0
    case utilities = 1
    case health = 2
    case social = 3
    case medicines = 4
    case finance = 5
    case skin = 6
    case surgeon = 7
}

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    static let segue = "homeSegue"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var homeSearchContainerView: UIView!
    @IBOutlet weak var homeSearchTextInput: UITextField!
    @IBOutlet weak var selectedCategotyLabel: UILabel!
    @IBOutlet weak var appListTableView: UITableView!
    @IBOutlet var homeMenuButtons: [UIButton]!
    @IBOutlet var homeMenuTitles: [UILabel]!
    
    let homeMenuList = ["Entertainment","Utilities","Health","Social","Medicines","Finance","Skin","Surgeon"]
    let appNames = ["YouTube","FaceBook","Netflix","YouTube","FaceBook","Netflix","YouTube","FaceBook","Netflix"]
    
    let appIcons = [UIImage(named: "Youtube"),
                    UIImage(named: "Facebook"),
                    UIImage(named: "Netflix"),
                    UIImage(named: "Youtube"),
                    UIImage(named: "Facebook"),
                    UIImage(named: "Netflix"),
                    UIImage(named: "Youtube"),
                    UIImage(named: "Facebook"),
                    UIImage(named: "Netflix")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUiProps()
    }
    
    
    func setUpUiProps() {
        self.homeSearchContainerView.layer.borderWidth = 1
        self.homeSearchContainerView.layer.cornerRadius = 8
        self.homeSearchContainerView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.homeSearchTextInput.placeholder = "Search app name, youtube etc"
        
        let nib = UINib(nibName: HomeCategoryTableViewCell.identifier, bundle: nil)
        appListTableView.register(nib, forCellReuseIdentifier: HomeCategoryTableViewCell.identifier)
        appListTableView.delegate = self
        appListTableView.dataSource = self
        
        self.hideLoginKeyboardWhenTappedAround()
        self.setMenuProps()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToFAQ))
        profileImage.addGestureRecognizer(tap)
        profileImage.isUserInteractionEnabled = true
    }
    
    
    func setMenuProps() {
        for (index, element) in homeMenuTitles.enumerated() {
            element.text = homeMenuList[index]
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appListTableView.dequeueReusableCell(withIdentifier: HomeCategoryTableViewCell.identifier, for: indexPath) as! HomeCategoryTableViewCell
        cell.selectionStyle = .none
        cell.cetegoryAddButton.tag = indexPath.row
        cell.categoryItemAppName.text = self.appNames[indexPath.row]
        cell.categoryItemAppIcon.image = self.appIcons[indexPath.row]
        cell.actionCellClick = {
            self.navigateToAppInstaller(appName: self.appNames[indexPath.row])
        }
        return cell
    }
    
    
    
    func navigateToAppInstaller(appName: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppInstalationViewController") as! AppInstalationViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.appName = appName
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func navigateToFAQ(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func homeMenuTapAction(_ sender: UIButton) {
        selectedCategotyLabel.text = homeMenuList[sender.tag]
        let categoryType = Category(rawValue: sender.tag)
        
        //Change table data array according to the category
        switch categoryType {
        case .entertainment:
            print("..entertainment")
        case .utilities:
            print("..utilities")
        case .health:
            print("..health")
        case .social:
            print("..social")
        case .medicines:
            print("..medicines")
        case .finance:
            print("..finance")
        case .skin:
            print("..skin")
        case .surgeon:
            print("..surgeon")
        default:
            print("..entertainment")
        }
        appListTableView.reloadData()
        
    }
    
}


extension HomeViewController {
    func hideLoginKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}




