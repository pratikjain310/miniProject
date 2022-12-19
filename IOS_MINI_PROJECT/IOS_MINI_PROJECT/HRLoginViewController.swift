//
//  HRLoginViewController.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 15/12/2022.
//

import UIKit
import Toast_Swift
class HRLoginViewController: UIViewController {
  
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        if userNameTextField.text == "snehal@felixtechlabs.com" && passwordTextField.text == "Snehal@123"{
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationDashboardViewController") as! NavigationDashboardViewController
            let window = UIApplication.shared.windows[0] as UIWindow
            UIView.transition(from: (window.rootViewController?.view)!, to: secondViewController.view, duration: 0.15, options: .transitionCrossDissolve) { bool in
                window.rootViewController = secondViewController
            }
        }else {
            self.view.makeToast("Please Enter Valid Username And Password", duration: 3.0, position: .top)
        }
    }
    
  

}
