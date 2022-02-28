//
//  DetailFRouter.swift
//  LoginFal
//
//  Created by Asesoftware on 28/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation
import UIKit

class DetailFRouter {
    
    private var sourceView: UIViewController?
    
    var viewController: UIViewController{
        return createViewController()
    }
    
    private func createViewController() -> UIViewController{
        let view = DetailFViewController(nibName: "DetailFViewController", bundle: Bundle.main)
        return view
    }
    
    func setSourceView( _ sourceView: UIViewController? ) {
        guard let view = sourceView else {fatalError("Error desconocido")}
        self.sourceView = view
    }
    
    func navigateToBack(){
        sourceView?.navigationController?.popViewController(animated: true)
    }
    

}
