//
//  NetworkManager.swift
//  ExamenNTTData
//
//  Created by Guillermo Matos on 12/09/23.
//

import Foundation

class NetworkManager {
    class func fetchData (urlSrting: String, completion: @escaping (Usuario?) -> Void ) {
        guard let url = URL(string: urlSrting) else {return}
        
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                let usuariomodel = try? JSONDecoder().decode(Usuario.self, from: data)
                completion(usuariomodel)
                print(usuariomodel)
            }
        }
        task.resume()
    }

}
