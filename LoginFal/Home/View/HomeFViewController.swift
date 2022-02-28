//
//  HomeFViewController.swift
//  LoginFal
//
//  Created by Asesoftware on 25/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeFViewController: UIViewController {
    
    private var viewModel = HomeFViewModel()
    private var router = HomeFRouter()

    @IBOutlet weak var tableView: UITableView!
    
    var dataResponse = [DataIndependent]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.bind(view: self, router: router)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Registro celda personalizada
        self.tableView.register(UINib(nibName: "TableViewCellFal", bundle: nil), forCellReuseIdentifier: "myCell")
        initViewModels()
        let view = LoaderView()
        view.modalPresentationStyle = .currentContext
        self.present(view, animated: false, completion: nil)
        self.viewModel.servicegetDataUser()
        // Do any additional setup after loading the view.
    }
    
    private func initViewModels(){
        
        self.viewModel.dataCorrect = { response in
            
            print("Response: \(response)")
            
            self.dataResponse = response
            self.tableView.reloadData()

           // self.dismiss(animated: false, completion: nil)
        }
        
        self.viewModel.dataError = { error in
            
            print("Error: \(error)")
            
        }
        
        
    }

    @IBAction func logout(_ sender: UIButton) {
        try! Auth.auth().signOut()
 
        self.dismiss(animated: true, completion: nil)
    }
}

extension HomeFViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableViewCellFal
        
        cell?.iitem2.text = dataResponse[indexPath.row].nombre
        cell?.item3.text = String(dataResponse[indexPath.row].valor)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.goDetail(dataV: dataResponse[indexPath.row])
    }
    
    
}
