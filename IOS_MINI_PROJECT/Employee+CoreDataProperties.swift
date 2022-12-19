//
//  Employee+CoreDataProperties.swift
//  IOS_MINI_PROJECT
//
//  Created by ashutosh deshpande on 16/12/2022.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var javaFlag: Int16
    @NSManaged public var androidFlag: Int16
    @NSManaged public var iOSFlag: Int16
    @NSManaged public var phpFlag: Int16
    @NSManaged public var angularFlag: Int16
    @NSManaged public var reactFlag: Int16

}

extension Employee : Identifiable {

}
