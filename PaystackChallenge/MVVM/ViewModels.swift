//
//  ViewModels.swift
//  PaystackChallenge
//
//  Created by Masud Onikeku on 03/07/2024.
//

import Foundation
import NetworkLibrary

class ViewModel : ObservableObject {
    
     
    @Published var repoResponse : Response? = nil
    
    func getData(page: Int) {
        
        let query = url + "a" + "&page=1&per_page=50"
        
        NetworkLibrary.shared.makeCall(url: query, completion: {[weak self] data, errorString in
            
            if let resData = data {
                
                let jsonRes = try? JSONSerialization.jsonObject(with: resData, options: []) as? [String : Any]
                print(jsonRes)
                let res = try? JSONDecoder().decode(APIResult.self, from: resData)
                
                if let res = res {
                    let repos = res.items
                    let totalItems = repos.sorted(by: { ($0.owner.login.lowercased() < ($1.owner.login.lowercased()))})
                    DispatchQueue.main.async {
                        self?.repoResponse = Response(successful: true, object: totalItems)
                    }
                }
                //
            }else {
                DispatchQueue.main.async {
                    self?.repoResponse = Response(successful: false, message: errorString ?? "", object: nil)
                }
            }
        })
    }
    
    
}

public struct Response {
    
    var successful : Bool
    var message: String?
    var object : Any?
}
