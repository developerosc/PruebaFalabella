//
//  HomeFViewModel.swift
//  LoginFal
//
//  Created by Asesoftware on 25/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation
import RxSwift


class HomeFViewModel{
    
    private weak var view: HomeFViewController?
    private var router: HomeFRouter?
    
    private var getDataService = DataService()
    private var disposeBag = DisposeBag()
    
    private var response: [DataIndependent]?
    
    var dataCorrect: ((_ response:[DataIndependent]) -> ())?
    var dataError: ((_ error:String) -> ())?
    
    func bind(view: HomeFViewController, router: HomeFRouter){
        self.view = view
        self.router = router
        //Se enlaza el router con la vista
        self.router?.setSourceView(view)
    }
    
    func servicegetDataUser(){
        return getDataService.accountUser()
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.response = response
            } onError: { error in
                print("ERROR: \(error.localizedDescription)")
                self.dataError!(error.localizedDescription)
            } onCompleted: {
                print("response onComplete::")
                self.dataCorrect!(self.response!)
//                self.validateApiCodeReponse()
            }.disposed(by: disposeBag)
    }
    
    func goDetail(dataV:DataIndependent) {
        self.router?.goDetailRouter(data: dataV)
    }
    
    
}
