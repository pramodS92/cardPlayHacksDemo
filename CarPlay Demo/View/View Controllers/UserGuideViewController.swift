//
//
// UserGuideViewController.swift
// CarPlay Demo
//
//Created by Pramod Ranasinghe on 6/5/21
// Copyright © 2021 CBC Tech Solutions. All rights reserved.


import UIKit

class UserGuideViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    @IBOutlet weak var stepCounterLabel: UILabel!
    @IBOutlet weak var stepDescription: UITextView!
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 9
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.2050077915, green: 1, blue: 0, alpha: 1)
        
        return pageControl
    }()
    
    let images = [UIImage(named: "image1"),
                  UIImage(named: "image2"),
                  UIImage(named: "image3"),
                  UIImage(named: "image4"),
                  UIImage(named: "image5"),
                  UIImage(named: "image6"),
                  UIImage(named: "image7"),
                  UIImage(named: "image8")]
    
    
    let userGuideDescriptions = ["Copy the following repository","Open Sileo/Cydia and  then click on the Sources Tab.",
                                 "Go to add Sources And Paste the repo, So that you can add it.",
                                 "Go to Search bar in Sileo/Cydia and search NGXPlay.Select NGXPlay11 in search results so that you can Install it to your iPhone.",
                                 "Open NGXPlay",
                                 "Select the option ‘Application’, then it will display all the installed apps on your phone.",
                                 "Select the desired app from the app list, which is to be added to CarPlay. Then it will show the app options.",
                                 "Simply switch on the Enable switch, then the app will be added to your CarPlay !"]
    
    let pageCount = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUiProps()
    }
    
    func setUiProps(){
        scrollView.delegate = self
        
        scrollView.backgroundColor = .clear
        pageControl.addTarget(self, action: #selector(pageControllDidChanged(_:)), for: .valueChanged)
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    @objc private func pageControllDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height - 70, width: view.frame.size.width - 20, height: 50)
        scrollView.frame = CGRect(x: 0, y: 180, width: view.frame.size.width, height:  view.frame.size.height - 100)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    func  configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(pageCount), height: scrollView.frame.size.height)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        for x in 0..<pageCount {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
            
            
            if x < 8 {
                let image = images[x]
                let imageView = UIImageView(image: image)
                imageView.frame = CGRect(x: 0, y: 40, width:  view.frame.size.width, height:  view.frame.size.height - 250)
                imageView.contentMode = .scaleAspectFill
                imageView.backgroundColor = .clear
                page.addSubview(imageView)
                self.view.bringSubviewToFront(imageView)
            }else{
                let view = completeStepGuide(x: x)
                page.addSubview(view)
                self.view.bringSubviewToFront(view)
            }
          
            
            scrollView.addSubview(page)
            
        }
    }
    
    @objc func navigateToHome() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func completeStepGuide(x: Int)->UIView{
        let page = UIView(frame: CGRect(x: 0 ,y: 0, width: view.frame.size.width,height: scrollView.frame.size.height))
    
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 15, width: view.frame.size.width, height: 22))
        titleLabel.text = "Its almost completed"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21.0)
        
        let descriptionTextField = UITextView(frame: CGRect(x: 20, y: 40, width: view.frame.size.width - 30, height: 40))
        let text = "One more step to make it fun.Let others know that you use App name on cardPlay"
        descriptionTextField.attributedText = text.withBoldText(textArray: ["App name on cardPlay"],fontSize: 13.0)
        descriptionTextField.font = titleLabel.font.withSize(13)
        descriptionTextField.textAlignment = .left
        descriptionTextField.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        let shareAppLabel = UILabel(frame: CGRect(x: 20, y: 250, width: view.frame.size.width/2, height: 22))
        shareAppLabel.text = "I do not want to share?"
        shareAppLabel.textAlignment = .left
        shareAppLabel.font = titleLabel.font.withSize(15)
        
        let backToAppListLabel =  UILabel(frame: CGRect(x: view.frame.size.width/2, y: 250, width: view.frame.size.width/2, height: 22))
        backToAppListLabel.text = "Back to App List"
        backToAppListLabel.textAlignment = .left
        backToAppListLabel.textColor = #colorLiteral(red: 0, green: 0.8005561829, blue: 0.4150190353, alpha: 1)
        backToAppListLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToHome))
        backToAppListLabel.isUserInteractionEnabled = true
        backToAppListLabel.addGestureRecognizer(tap)
        
        page.addSubview(titleLabel)
        page.addSubview(descriptionTextField)
        page.addSubview(shareAppLabel)
        page.addSubview(backToAppListLabel)
        
        page.backgroundColor = .white
        return page
    }
    
    
}


extension UserGuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = Int(floorf( Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        pageControl.currentPage = pageNumber
        if pageNumber >= 0 && pageNumber < 8{
            self.stepDescription.isHidden = false
            self.stepCounterLabel.isHidden = false
            self.stepCounterLabel.text =  "Step " + String(pageNumber + 1)
            self.stepDescription.text =  userGuideDescriptions[pageNumber]
        }else{
            self.stepCounterLabel.isHidden = true
            self.stepDescription.isHidden = true
        }
        
    }
}

