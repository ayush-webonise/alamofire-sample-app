
//  ModelAPIUtility.swift
//  alamofireObjectMapperSample

import Foundation
import ObjectMapper

let ModelAPIUtilityInstance = ModelAPIUtility()

class ModelAPIUtility {
    func callWeatherWebService(city: String, completionHandler: ((_ weatherModel: WeatherModel?) -> ())?) {
        
        let parameters = [
            "q": city,
            "appid": "82d42d1bbaa0bbec840a96ca44a1660d"
        ]
        AlamofireUtilityInstance.getCallWithAlamofireUtility(url: "http://api.openweathermap.org/data/2.5/weather?",
                                                             requestParams: parameters,
                                                             success: { (response) in
                                                                
                                                                if let response = response as? [String: Any],
                                                                    let weatherModel = Mapper<WeatherModel>().map(JSON: response) {
                                                                    print("weatherModel: \(weatherModel)")
                                                                    completionHandler!(weatherModel)
                                                                } else {
                                                                    completionHandler!(nil)
                                                                }
                                                                
        },
                                                             failure: { (error) in
                                                                print(error ?? "error as default")
        })
        
    }
}
