
//  AlamofireUtility.swift
//  alamofireObjectMapperSample

import Foundation
import Alamofire

let AlamofireUtilityInstance = AlamofireUtility()

class AlamofireUtility {
    func getCallWithAlamofireUtility(url: String,
                                     requestParams: Any? = [:],
                                     success: @escaping ((_ response: Any?)->()),
                                     failure: @escaping (_ error: NSError?)->()) {
        
        Alamofire.request(url, method: .get, parameters: requestParams as? [String:Any]).validate().responseJSON { (response) in
            if let error = response.result.error {
                failure(error as NSError)
            } else {
                success(response.result.value as Any?)
            }
            
        }
    }
}
