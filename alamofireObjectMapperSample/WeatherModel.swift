
//  WeatherModel.swift
//  alamofireObjectMapperSample

import Foundation
import ObjectMapper

class WeatherModel: Mappable {
    var coord: Coord!
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        coord <- map["coord"]
    }
}

class Coord: Mappable {
    var latitude: Double = 0
    var longitude: Double = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        latitude <- map["lat"]
        longitude <- map["lon"]
    }
}
