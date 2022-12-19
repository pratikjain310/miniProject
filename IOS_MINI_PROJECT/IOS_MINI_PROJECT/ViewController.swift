//
//  ViewController.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 15/12/2022.
//

import UIKit

class ViewController: UIViewController {
// created IBoutlet of segmentControl
    @IBOutlet weak var switchSegmentControl: UISegmentedControl!
    // created lazy variable to use in segment controller
    lazy var employeeViewController : EmployeeViewController = {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeeViewController")as! EmployeeViewController
        return vc
    }()
    
    lazy var hrLoginViewController : HRLoginViewController = {
        let vc =  storyboard?.instantiateViewController(withIdentifier: "HRLoginViewController") as! HRLoginViewController
        return vc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }

    // setUp function is made private so it is used in this class only
    private func setUP(){
        switchSegmentControl.addTarget(self, action: #selector(segmentChange(sender:)), for: .valueChanged)
        switchSegmentControl.selectedSegmentIndex = 0
        addView(asViewController: employeeViewController)
    }
      

    @objc func segmentChange(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            removeView(asViewController: hrLoginViewController)
            addView(asViewController: employeeViewController)
        }else {
            removeView(asViewController: employeeViewController)
            addView(asViewController: hrLoginViewController)
        }
    }
    
    //this function is written to add view on viewController while changing it on segments
    private func addView(asViewController viewController : UIViewController){
        addChild(viewController)
        view.addSubview(viewController.view)
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        self.didMove(toParent: self)
    }
    
    //this function is written to remove view on viewController while changing it on segments
    private func removeView(asViewController viewController : UIViewController){
        willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

