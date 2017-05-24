
//  ShowWeatherDetailsViewController.swift
//  alamofireObjectMapperSample

import UIKit
import ObjectMapper

class ShowWeatherDetailsViewController: UIViewController {

    @IBOutlet weak var labelShowWeatherDetails: UILabel!
    
    var weatherDetails: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonString = weatherDetails?.toJSONString()
        print("JSON STRING: \(jsonString)")
        
        let wmodel = Mapper<WeatherModel>().map(JSONString: jsonString!)
        
        print("wmodel is working: \(wmodel?.coord.latitude)")
        
        // Do any additional setup after loading the view.
        labelShowWeatherDetails.text = String(describing: (weatherDetails?.coord.latitude)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
