//
//  DetailFViewController.swift
//  LoginFal
//
//  Created by Asesoftware on 28/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import UIKit

class DetailFViewController: UIViewController {
    
    var dataForCell:DataIndependent?
    
    @IBOutlet weak var item1: UILabel!
    @IBOutlet weak var item2: UILabel!
    @IBOutlet weak var item3: UILabel!
    @IBOutlet weak var item4: UILabel!
    @IBOutlet weak var item5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item1.text = dataForCell?.codigo
        item2.text = dataForCell?.nombre
        item3.text = dataForCell?.unidad_medida
        item4.text = dataForCell?.fecha
        item5.text = "\(dataForCell?.valor ?? 0)"
        

        // Do any additional setup after loading the view.
    }

    @IBAction func goClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
