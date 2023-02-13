//
//  EmployeeResource.swift
//  CDcrudOperations
//
//  Created by CodeCat15 on 6/19/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

protocol EmployeeRepository {

    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
}

/* Thank you for downloading the source code, I hope the video was helpful and if you are having any questions then I would be happy to answer them so do feel free to ask as YouTube comment or via email codecat15@gmail.com

Note: If you think this video was helpful and someone can benefit from it, then please do share this and if you care new to the channel I request you to please subscribe to the channel :)*/

struct EmployeeDataRepository : EmployeeRepository
{
    func create(employee: Employee) {
        let CDEmployee = CDEmployee(context: PersistentStorage.shared.context)
        CDEmployee.name = employee.name
        CDEmployee.email = employee.email
        CDEmployee.profilePic = employee.profilePicture
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employees: [Employee] = []
        
        result?.forEach({ employee in
            employees.append(employee.convertToEmployee())
        })
        return employees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(by: id)
        guard result != nil else {
            return nil
        }
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        let result = getCDEmployee(by: employee.id)
        guard result != nil else {
            return false
        }
        result?.name = employee.name
        result?.profilePic = employee.profilePicture
        result?.email = employee.email
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let result = getCDEmployee(by: id)
        guard result != nil else {
            return false
        }
        PersistentStorage.shared.context.delete(result!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func getCDEmployee(by identifier: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", identifier as CVarArg)
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {
                return nil
            }
            return result
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
    
//    func create(employee: Employee) {
//
//        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
//        cdEmployee.email = employee.email
//        cdEmployee.name = employee.name
//        cdEmployee.id = employee.id
//        cdEmployee.profilePic = employee.profilePicture
//
//        PersistentStorage.shared.saveContext()
//
//
//    }
//
//    func getAll() -> [Employee]? {
//
//        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
//
//        var employees : [Employee] = []
//
//        result?.forEach({ (cdEmployee) in
//            employees.append(cdEmployee.convertToEmployee())
//        })
//
//        return employees
//    }
//
//    func get(byIdentifier id: UUID) -> Employee? {
//
//        let result = getCDEmployee(byIdentifier: id)
//        guard result != nil else {return nil}
//        return result?.convertToEmployee()
//    }
//
//    func update(employee: Employee) -> Bool {
//
//        let cdEmployee = getCDEmployee(byIdentifier: employee.id)
//        guard cdEmployee != nil else {return false}
//
//        cdEmployee?.email = employee.email
//        cdEmployee?.name = employee.name
//        cdEmployee?.profilePic = employee.profilePicture
//
//        PersistentStorage.shared.saveContext()
//        return true
//    }
//
//    func delete(id: UUID) -> Bool {
//
//        let cdEmployee = getCDEmployee(byIdentifier: id)
//        guard cdEmployee != nil else {return false}
//
//        PersistentStorage.shared.context.delete(cdEmployee!)
//        PersistentStorage.shared.saveContext()
//        return true
//    }
//
//
//    private func getCDEmployee(byIdentifier id: UUID) -> CDEmployee?
//    {
//        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
//        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
//
//        fetchRequest.predicate = predicate
//        do {
//            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
//
//            guard result != nil else {return nil}
//
//            return result
//
//        } catch let error {
//            debugPrint(error)
//        }
//
//        return nil
//    }
    
//    private func getbyID(id: UUID) -> CDEmployee? {
//        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
//        let predicate = NSPredicate(format: "id=%@", id as CVarArg)
//        
//        fetchRequest.predicate = predicate
//        
//        do {
//            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first!
//            guard result != nil else {
//                return nil
//            }
//            return result
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
    
    func storeEmployee(employee: Employee) {
        let CDEmployee = CDEmployee(context: PersistentStorage.shared.context)
        CDEmployee.name = employee.name
        CDEmployee.email = employee.email
        CDEmployee.id = employee.id
        CDEmployee.profilePic = employee.profilePicture
        PersistentStorage.shared.saveContext()
    }
    
    func fetchEmployeebyID(by id: UUID)-> CDEmployee? {
        let request = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id=%@", id as CVarArg)
        request.predicate = predicate
        
        do {
            let employeeData = try PersistentStorage.shared.context.fetch(request).first
            guard employeeData != nil else {
                return nil
            }
            return employeeData
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
    
    func updateEmployeeData(employee: Employee) {
        let result = fetchEmployeebyID(by: employee.id)
        result?.name = employee.name
        result?.profilePic = employee.profilePicture
        result?.email = employee.email
        PersistentStorage.shared.saveContext()
    }
    
    func deleteEmployeeData(employee: Employee) -> Bool {
        let result = fetchEmployeebyID(by: employee.id)
        guard result != nil else {
            return false
        }
        PersistentStorage.shared.context.delete(result!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func fetchAll(employee: Employee) -> [Employee] {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard result != nil else {
            return []
        }
        var resultEmployee = [employee]
        result?.forEach({ employee in
            resultEmployee.append(employee.convertToEmployee())
        })
        return resultEmployee
    }
    
    func buildEmployee(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.name = employee.name
        PersistentStorage.shared.saveContext()
    }
    
    func scratchEmployee(employee: Employee) -> [Employee] {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        guard result != nil else {
            return []
        }
        var resultemployee:[Employee] = []
        result?.forEach({ employee in
            resultemployee.append(employee.convertToEmployee())
        })
        return resultemployee
    }
    
    func scratchEmployeebyId(id: UUID) -> CDEmployee? {
        let request = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id=%@", id as CVarArg)
        request.predicate = predicate
        
        do {
            let empdata = try PersistentStorage.shared.context.fetch(request).first
            guard empdata != nil else {
                return nil
            }
            return empdata
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
}


