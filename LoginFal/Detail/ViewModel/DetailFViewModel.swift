//
//  DetailFViewModel.swift
//  LoginFal
//
//  Created by Asesoftware on 28/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation
import RxSwift


class DetailFViewModel{
    
    private weak var view: DetailFViewController?
    private var router: DetailFRouter?
    
    private var getDataService = DataService()
    private var disposeBag = DisposeBag()
    
    private var response: [DataIndependent]?
    
    var dataCorrect: ((_ response:[DataIndependent]) -> ())?
    var dataError: ((_ error:String) -> ())?
    
    func bind(view: DetailFViewController, router: DetailFRouter){
        self.view = view
        self.router = router
        //Se enlaza el router con la vista
        self.router?.setSourceView(view)
    }
    
    
    func navigateToBack() {
        self.router?.navigateToBack()
    }
    
    
}
