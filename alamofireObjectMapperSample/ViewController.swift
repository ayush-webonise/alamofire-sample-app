
//  ViewController.swift
//  alamofireObjectMapperSample

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelCityName: UITextField!
    
    var weatherModel: WeatherModel = WeatherModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonActionCheckWeather(_ sender: UIButton) {
        if !(labelCityName.text?.isEmpty)! {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let showWeatherDetailsViewController = storyboard.instantiateViewController(withIdentifier: "ShowWeatherDetailsViewController") as? ShowWeatherDetailsViewController
            //call web service
//            webServiceCallToGetWeather {
//                showWeatherDetailsViewController?.weatherDetails = self.weatherModel
//                self.navigationController?.pushViewController(showWeatherDetailsViewController ?? ShowWeatherDetailsViewController(), animated: true)
//            }
            ModelAPIUtilityInstance.callWeatherWebService(city: labelCityName.text!) { (weatherModel) in
                
                showWeatherDetailsViewController?.weatherDetails = weatherModel ?? WeatherModel()
                self.navigationController?.pushViewController(showWeatherDetailsViewController ?? ShowWeatherDetailsViewController(), animated: true)
            }
        }
    }
    
//    func webServiceCallToGetWeather(completionBlock: @escaping (() -> ())) {
//        let cityName = labelCityName.text ?? ""
//        
//        ModelAPIUtilityInstance.callWeatherWebService(city: cityName) { (weatherModel) in
//            self.weatherModel = weatherModel ?? WeatherModel()
//            completionBlock()
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

