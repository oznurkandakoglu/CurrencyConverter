//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Tiga  on 5.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chfLabek: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var kpyLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        // closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else{
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, Any>
                        
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String: Any]{
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD : " + String(cad)
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabek.text = "CHF : " + String(chf)
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.gbpLabel.text = "CAD : " + String(gbp)
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.kpyLabel.text = "JPY : " + String(jpy)
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD : " + String(usd)
                                }
                                if let tr = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY : " + String(tr)
                                }
                            }
                        }
        
                
                    }catch{
                        print("error")
                    }
                   
                }
            }
        }
        task.resume()
        
    }
    
}

