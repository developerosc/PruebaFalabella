//
//  ApiResult.swift
//  LoginFal
//
//  Created by Asesoftware on 28/02/22.
//  Copyright © 2022 Oscar Daza. All rights reserved.
//

import Foundation

// MARK: - ApiResult
struct ApiResult {
    let version: String
    let autor: String
    let fecha: String
    let uf: Any?
    let ivp: Any?
    let dolar: Any?
    let dolar_intercambio: Any?
    let euro: Any?
    let ipc: Any?
    let utm: Any?
    let imacec: Any?
    let tpm: Any?
    let libra_cobre: Any?
    let tasa_desempleo: Any?
    let bitcoin: Any?

    init(json: [String:Any]){
        version = json["version"] as? String ?? ""
        autor = json["autor"] as? String ?? ""
        fecha = json["fecha"] as? String ?? ""
        uf = json["uf"]
        ivp = json["ivp"]
        dolar = json["dolar"]
        dolar_intercambio = json["dolar_intercambio"]
        euro = json["euro"]
        ipc = json["ipc"]
        utm = json["utm"]
        imacec = json["imacec"]
        tpm = json["tpm"]
        libra_cobre = json["libra_cobre"]
        tasa_desempleo = json["tasa_desempleo"]
        bitcoin = json["bitcoin"]
    }
    
}
struct DataIndependent:Codable {
    
    let codigo: String
    let nombre: String
    let unidad_medida: String
    let fecha: String
    let valor: Double

    init(json: [String:Any]){
        codigo = json["codigo"] as? String ?? ""
        nombre = json["nombre"] as? String ?? ""
        unidad_medida = json["unidad_medida"] as? String ?? ""
        fecha = json["fecha"] as? String ?? ""
        valor = json["valor"] as? Double ?? 0.0
    }
}
