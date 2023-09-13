//
//  UsuarioViewModel.swift
//  ExamenNTTData
//
//  Created by Guillermo Matos on 12/09/23.
//

import Foundation

class UsuarioViewModel {
    
    var user: Usuario?
    
    func getUsuario(completion: @escaping (Usuario?)->Void ) {
        
        NetworkManager.fetchData(urlSrting: "https://randomuser.me/api") { usuario in
            
            if let usuario {
                self.user = usuario
                completion(usuario)
            }
        }
    }
    
}
