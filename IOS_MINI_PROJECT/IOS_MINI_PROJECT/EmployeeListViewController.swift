//
//  EmployeeListViewController.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 19/12/2022.
//

import UIKit

class EmployeeListViewController: UIViewController {
    // employeeList variable is made optional becuase we are assigning its value from dashboardViewController at the time of navigation from dashboardViewController to EmployeeListViewController
    var employeeList : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = "Employee List"
        // Do any additional setup after loading the view.
    }
}

//Data Showned on TableView
extension EmployeeListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = employeeList![indexPath.row]
        return cell!
    }
    
    
}
