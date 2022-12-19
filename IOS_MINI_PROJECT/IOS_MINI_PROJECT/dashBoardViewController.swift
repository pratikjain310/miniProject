//
//  dashBoardViewController.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 15/12/2022.
//

import UIKit
import Toast_Swift
class dashBoardViewController: UIViewController {
    //Created Obj empArr of Table Employee
    var empArr : [Employee] = []
    // Created Context to save data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // Created array of Technology
    let techArr : [String] = ["Java", "Android", "iOS", "PHP", "Angular", "React"]
    //cretaed Variable for displaying count of particular Technology
    var javaCount = 0
    var androidCount = 0
    var iOSCount = 0
    var phpCount = 0
    var angularCount = 0
    var reactCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = ""
        fetch() // function call
        countFlag()  // function call
      
    }
    
    //fetch function is written to fetch all the data from Employee Table
    func fetch(){
        do {
            empArr = try context.fetch(Employee.fetchRequest())
        }catch let error {
            self.view.makeToast("\(error.localizedDescription)", duration: 3.0, position: .top)
        }
    }
    // LogOut function is written on this bar button
    @IBAction func logoutBarButton(_ sender: UIBarButtonItem) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
        let window = UIApplication.shared.windows[0] as UIWindow
        UIView.transition(from: (window.rootViewController?.view)!, to: secondViewController.view, duration: 0.15, options: .transitionCrossDissolve) { bool in
            window.rootViewController = secondViewController
        }
   
    }
    
// counting the total count of particular technology
    func countFlag(){
       
        for emp in empArr {
            javaCount += Int(emp.javaFlag)
            androidCount += Int(emp.androidFlag)
            iOSCount += Int(emp.iOSFlag)
            phpCount += Int(emp.phpFlag)
            angularCount += Int(emp.angularFlag)
            reactCount += Int(emp.reactFlag)
            
        }
    }
}

// data is displayed on collection view
extension dashBoardViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return techArr.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! dashboardCollectionViewCell
        let techName = techArr[indexPath.row]
        cell.techLabel.text = techName
        // checking for what label technology is there on Cell and according to that displaying its count
        if techName == "Java"{
            cell.countLabel.text = String(javaCount)
        }else if techName == "Android"{
            cell.countLabel.text = String(androidCount)
        }else if techName == "iOS"{
            cell.countLabel.text = String(iOSCount)
        }else if techName == "PHP"{
            cell.countLabel.text = String(phpCount)
        }else if techName == "Angular"{
            cell.countLabel.text = String(angularCount)
        }else {
            cell.countLabel.text = String(reactCount)
        }
      
        return cell
    }
    // fetching employee list for particular technology and passing it on employeeListViewController to display name of employee for particular technology
    func fetchEmployeeList(indexPath : IndexPath) -> [String]{
        let techName = techArr[indexPath.row]
        var empTechArr : [String] = []
      
        if techName == "Java"{
            for emp in empArr {
                if emp.javaFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }else if techName == "Android"{
            for emp in empArr {
                if emp.androidFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }else if techName == "iOS"{
            for emp in empArr {
                if emp.iOSFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }else if techName == "PHP"{
            for emp in empArr {
                if emp.phpFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }else if techName == "Angular"{
            for emp in empArr {
                if emp.angularFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }else {
            for emp in empArr {
                if emp.reactFlag == 1 {
                    empTechArr.append(emp.firstName!)
                }
            }
        }
        return empTechArr
    }
     // after selecting perticular cell it will navigate to employyeListViewController and sending data of employee using storyboard id
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmployeeListViewController")as! EmployeeListViewController
        let empTechArr = fetchEmployeeList(indexPath: indexPath)
        vc.employeeList = empTechArr
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 186, height: 77)
    }
}
