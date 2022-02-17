//
//  ViewController.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

/// MVC
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    
    var appCarCollection : CarCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCarCollection = (UIApplication.shared.delegate as! AppDelegate).carCollection
        
    }

    @IBAction func addCar(_ sender: Any) {
        
        if let model = modelText.text {
            if let year = yearText.text {
                if !model.isEmpty && !year.isEmpty{
                    if let correctYear = Int(year){
                        appCarCollection?.addNewCar(m: model, y: correctYear)
                    }
                }
            }
            }
        }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let CTVC = segue.destination as! CarsTableViewController
        
        CTVC.carsListFromFVC = appCarCollection!.allCars
        
    }
    }

