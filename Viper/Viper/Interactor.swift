//
//  Interactor.swift
//  Viper
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import Foundation
import UIKit




class LoginInteractor {
    
    var loginDetail: Login?
    
    var logindata: [String] = []
    
    func fetchLoginDetails(completion: @escaping (String) -> Void) {
        completion("Sudipta")
        self.loginDetail?.displayData(name:"Sudipta")
    }
    
    var url = URL(string: apiEndpoint().endPoint)
    
    func fetchApiData(completion: @escaping (String) -> Void) {
         URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                return
            }

             do {
                 let receivedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                 completion(receivedResponse.login)
             } catch let error {
                 debugPrint(error.localizedDescription)
             }
        }
    }
}


