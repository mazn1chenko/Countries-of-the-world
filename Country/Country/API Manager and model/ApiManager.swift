//
//  ApiManager.swift
//  Country
//
//  Created by m223 on 23.02.2023.
//

import Foundation

enum ObtainCountryResult {
    
    case success(country: [CountryElement])
    case failure(error: Error)
    
}

class ApiManager {
    
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    
    let decoder = JSONDecoder()
    
    var apiArray = [CountryElement]()
    
    func obtainsCounry(completion: @escaping (ObtainCountryResult) -> Void) {
        
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
             return
        }
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: ObtainCountryResult
            
            defer {

                DispatchQueue.main.async {
                    completion(result)
                }
                }
            
            guard let strongSelf = self else {
                
                result = .success(country: [])

                return

            }
            
            if error == nil, let parsData = data {
                
                guard let country = try?
                        strongSelf.decoder.decode([CountryElement].self, from: parsData) else {
                    result = .success(country: [])
                    return
                }
                result = .success(country: country)
                    }
                     else{
                         result = .failure(error: error!)
            }
            completion(result)
            
        } .resume()
    }
}
