//
//  ViewController.swift
//  WatherApp
//
//  Created by ABDULRHMAN ALFULAYT on 6/15/16.
//  Copyright © 2016 Design Studio. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromUrl()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func getDataFromUrl() {
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?id=105343&units=metric&APPID=071913a041f022290a6651f463045c65")
            .responseJSON { response in

  
                if let JSON = response.result.value {
                
                    if let temp = JSON["main"]!!["temp"]!  {
                        self.temp.text = String(temp) + "°"
                    }
                    
                    if let humidity = JSON["main"]!!["humidity"]!  {
                        self.humidity.text = String(humidity) + "%"
                    }
                    
                    if let wind = JSON["wind"]!!["speed"]!  {
                        self.windSpeed.text = String(wind) + " km/h"
                    }
                    

                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

