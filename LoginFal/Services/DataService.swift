//
//  DataService.swift
//  LoginFal
//
//  Created by Asesoftware on 25/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire


class DataService {
    
    
    func accountUser() -> Observable<[DataIndependent]> {
        
        let url = Constants.URL.main
        
        
        return Observable.create { observer -> Disposable in
            
            AF.request(url, method: .get, interceptor: nil)
                    .validate()
                    .responseJSON{ response in
                        switch response.result {
                        case .success:
                            print("✅ statusCode: \(String(describing: response.response?.statusCode)) service: \(String(describing: response.request?.urlRequest)) response: \(response.description)")
                            guard let data = response.data else { return }
                            do {
                                guard let apiResultJson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else{ return }
                                let apiResult = ApiResult(json: apiResultJson)
                                if(apiResult.version != ""){
                                    var getAllData = [DataIndependent]()
                                    let data = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.uf!))
                                    getAllData.append(data)
                                    let data1 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.ivp!))
                                    getAllData.append(data1)
                                    let data2 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.dolar!))
                                    getAllData.append(data2)
                                    let data3 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.dolar_intercambio!))
                                    getAllData.append(data3)
                                    let data4 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.euro!))
                                    getAllData.append(data4)
                                    let data5 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.ipc!))
                                    getAllData.append(data5)
                                    let data6 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.utm!))
                                    getAllData.append(data6)
                                    let data7 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.imacec!))
                                    getAllData.append(data7)
                                    let data8 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.tpm!))
                                    getAllData.append(data8)
                                    let data9 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.libra_cobre!))
                                    getAllData.append(data9)
                                    let data10 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.tasa_desempleo!))
                                    getAllData.append(data10)
                                    let data11 = try JSONDecoder().decode(DataIndependent.self, from: JSONSerialization.data(withJSONObject: apiResult.bitcoin!))
                                    getAllData.append(data11)
                                    observer.onNext(getAllData)
                                }else{
                                    let userInfo =
                                        [
                                            NSLocalizedDescriptionKey :  NSLocalizedString("Exception", value: apiResult.version, comment: "")
                                        ]
                                    let err = NSError(domain: "", code: response.response!.statusCode, userInfo: userInfo)
                                    observer.onError(err)
                                }
                            }   catch DecodingError.keyNotFound(let key, let context) {
                                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                            } catch DecodingError.valueNotFound(let type, let context) {
                                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                            } catch DecodingError.typeMismatch(let type, let context) {
                                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                            } catch DecodingError.dataCorrupted(let context) {
                                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                            } catch let error as NSError {
                                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                            }
                        case .failure(let error):
                            observer.onError(error)
                        }
                        observer.onCompleted()
                    }
         
                return Disposables.create()
            }
        
    }
    
}
