//
//  Trip.swift
//  LocalGuidi
//
//  Created by Bayu Aslama  on 20/07/21.
//

import Foundation


struct Trip: Codable{
    let trips: [TripItem]?
}

struct TripItem: Codable{
    let id: Int?
    let DestinationId: Int?
    let img: [String]?
    let name: String?
    let province: Int?
    let price: Int?
    let durationType: Int?
    let isPrivate: Int?
    let duration: String?
}
