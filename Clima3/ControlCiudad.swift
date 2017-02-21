//
//  ControlCiudad.swift
//  Clima3
//
//  Created by Rodrigo on 19/02/17.
//  Copyright © 2017 Rodrigo Hernandez. All rights reserved.
//

import UIKit

class ControlCiudad: UIViewController {

    var codigo = ""
    var unidadTemperatura:String = ""
    var ciudad:String = ""
    @IBOutlet weak var labTemperatura: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urls = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20="
        print("Codigo Ciudad:" + self.codigo)
        
        /* Para Antigua URL:
         let url = NSURL(string: urls + self.ciudades[row][1] + "%27")
         */
        /* Para Nueva URL: */
        let url = NSURL(string: urls + self.codigo + "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        let datos = NSData(contentsOf: url! as URL)
        print(datos!)
        do {
            let json = try JSONSerialization.jsonObject(with: datos! as Data, options: .mutableLeaves)
            let dico1 =  json as! NSDictionary
            let dico2 = dico1["query"] as! NSDictionary
            if(dico2["results"] != nil){
                if(dico2["results"] != nil){
                    let results = dico2["results"] as! NSDictionary
                    let channel = results["channel"] as! NSDictionary
                    let units = channel["units"] as! NSDictionary
                    let location = channel["location"] as! NSDictionary
                    ciudad = location["city"] as! NSString as String
                    unidadTemperatura = units["temperature"] as! NSString as String
                    let item = channel["item"] as! NSDictionary
                    let condition = item["condition"] as! NSDictionary
                    self.labTemperatura.text = condition["temp"] as! NSString as String + unidadTemperatura
                }
            }
            
        }
        catch _ {
            
        }

        
        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
