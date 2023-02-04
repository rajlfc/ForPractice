//
//  ViewController.swift
//  Viper
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import UIKit

protocol finalDisplay {
    func displaylast(name: String)
}

class ViewController: UIViewController,finalDisplay {
    var finalLogin: Login?
    
   
    
    func displaylast(name: String) {
        print("name: \(name)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        LoginInteractor().fetchLoginDetails { name in
            self.finalLogin?.displayData(name: name)
        }
        
        
        
        
    }


}

