//
//  Presenter.swift
//  Viper
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import Foundation

protocol Login: NSObject {
    func displayData(name: String)
}

class LoginPresenter: NSObject, Login {
    var finalView: finalDisplay?
    func displayData(name: String) {
        self.finalView?.displaylast(name: name)
    }
}
