//
//  EmployeeViewController.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 15/12/2022.
//

import UIKit
import CoreData
import Toast_Swift
class EmployeeViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var reactButton: UIButton!
    @IBOutlet weak var angularButton: UIButton!
    @IBOutlet weak var phpButton: UIButton!
    @IBOutlet weak var iOSButton: UIButton!
    @IBOutlet weak var androidButton: UIButton!
    @IBOutlet weak var javaButton: UIButton!
    
    
    var javaFlag = 0
    var androidFlag = 0
    var iOSFlag = 0
    var phpFlag = 0
    var angularFlag = 0
    var reactFlag = 0
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        clear()
    }
    func clear(){
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        phoneTextField.text = ""
        javaButton.isSelected = false
        androidButton.isSelected = false
        iOSButton.isSelected = false
        phpButton.isSelected = false
        angularButton.isSelected = false
        reactButton.isSelected = false
    }
    
    @IBAction func javaButton(_ sender: UIButton) {
        if sender.isSelected {
            javaFlag = 0
            sender.isSelected = false
        }else {
            javaFlag = 1
            sender.isSelected = true
        }
    }
    
    @IBAction func androidButton(_ sender: UIButton) {
        if sender.isSelected {
            androidFlag = 0
            sender.isSelected = false
        }else {
            androidFlag = 1
            sender.isSelected = true
        }
    }
    
    @IBAction func iOSButton(_ sender: UIButton) {
        if sender.isSelected {
            iOSFlag = 0
            sender.isSelected = false
        }else {
            iOSFlag = 1
            sender.isSelected = true
        }
    }
    
    @IBAction func phpButton(_ sender: UIButton) {
        if sender.isSelected {
            phpFlag = 0
            sender.isSelected = false
        }else {
            phpFlag = 1
            sender.isSelected = true
        }
    }
    
    @IBAction func angularButton(_ sender: UIButton) {
        if sender.isSelected {
            angularFlag = 0
            sender.isSelected = false
        }else {
            angularFlag = 1
            sender.isSelected = true
        }
    }
    
    @IBAction func reactButton(_ sender: UIButton) {
        if sender.isSelected {
            reactFlag = 0
            sender.isSelected = false
        }else {
            reactFlag = 1
            sender.isSelected = true
        }
    }
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func validatePhone(value: String) -> Bool {
        let phoneRegex = "^[6-9]\\d{9}$"
               let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
               return phoneTest.evaluate(with: value)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
       let emp = Employee(context: context)
       
        if firstNameTextField.text != ""{
            let firstname = firstNameTextField.text
            let countFirstName = firstname?.count
            if countFirstName! >= 10 {
                self.view.makeToast("Max Lenght for First Name is 10", duration: 3.0, position: .top)
                return
            }
        }
        if lastNameTextField.text != ""{
            let lastname = lastNameTextField.text
            let countLastName = lastname?.count
            if countLastName! >= 10 {
                self.view.makeToast("Max Lenght for Last Name is 10", duration: 3.0, position: .top)
                return
            }
        }
        if emailTextField.text != "" {
            if !isValidEmail(email: emailTextField.text!){
                self.view.makeToast("Enter Valid Email", duration: 3.0, position: .top)
                return
            }
        }
        if phoneTextField.text != "" {
            if !validatePhone(value: phoneTextField.text!){
                self.view.makeToast("Enter Valid Phone Number", duration: 3.0, position: .top)
                return
            }
        }
        
        if firstNameTextField.text != "" && lastNameTextField.text != "" && emailTextField.text != "" && phoneTextField.text != "" {
            if javaFlag == 1 || androidFlag == 1 || iOSFlag == 1 || phpFlag == 1 || angularFlag == 1 || reactFlag == 1 {
                emp.firstName = firstNameTextField.text
                emp.lastName = lastNameTextField.text
                emp.email = emailTextField.text
                emp.phone = phoneTextField.text
                emp.javaFlag = Int16(javaFlag)
                emp.androidFlag = Int16(androidFlag)
                emp.iOSFlag = Int16(iOSFlag)
                emp.phpFlag = Int16(phpFlag)
                emp.angularFlag = Int16(angularFlag)
                emp.reactFlag = Int16(reactFlag)
                do {
                    try context.save()
                }catch let error {
                    self.view.makeToast("\(error.localizedDescription)", duration: 3.0, position: .top)
                }
               
                self.view.makeToast("Data Saved", duration: 3.0, position: .top)
               clear()
            }else{
                self.view.makeToast("Please Select Atleast 1 Technology", duration: 3.0, position: .top)
            }
        }else {
            self.view.makeToast("Fill All the Details", duration: 3.0, position: .top)
        }
    }
}

