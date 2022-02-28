//
//  LoginFalabellaViewModel.swift
//  LoginFal
//
//  Created by Asesoftware on 28/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation

class LoginFalabellaViewModel{
    
    private weak var view: LoginFalabellaViewController?
    private var router: LoginFalabellaRouter?
    
    func bind(view: LoginFalabellaViewController, router: LoginFalabellaRouter){
        self.view = view
        self.router = router
        //Se enlaza el router con la vista
        self.router?.setSourceView(view)
    }
    
    func navigateToBack() {
        self.router?.navigateToBack()
    }
    
    func goHome() {
        self.router?.goHomeRouter()
    }
}
