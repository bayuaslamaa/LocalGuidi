//
//  HomeAPI.swift
//  LocalGuidi
//
//  Created by Bayu Aslama  on 20/07/21.
//

import Foundation
import Alamofire

class HomeAPI{
    static let shared = HomeAPI()
    
    func getTrips(completion: @escaping([TripItem]?, AFError?) -> ()){
        let url = "https://shrouded-anchorage-54606.herokuapp.com/itinenary/filter"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: [TripItem].self) { response in
                switch response.result {
                    case .success(let trips):
                        completion(trips, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
}
