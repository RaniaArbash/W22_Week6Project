//
//  ViewController.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

/// MVC
import UIKit
protocol AddCarDelegate{
    func carVCDidFinishWithCar(model: String, year : Int);
    func carVCDidFinishWithCancel();
}

class ViewController: UIViewController ,
                        UIImagePickerControllerDelegate ,
                        UINavigationControllerDelegate{

    var delegate: AddCarDelegate?
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    
    var appCarCollection : CarCollection?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

  
    @IBAction func addNewPhoto(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = .photoLibrary
        c.allowsEditing = false
        c.delegate = self
        present(c, animated: true, completion: nil)
        
    }
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.carVCDidFinishWithCancel()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addCar(_ sender: Any) {
        
        guard let model = modelText.text else { showErrorMsg(); return }
        guard let year = yearText.text else {showErrorMsg() ; return }
        guard !model.isEmpty && !year.isEmpty else {showErrorMsg();  return}
        guard let correctYear = Int(year) else {showErrorMsg() ; return}
                
        
        delegate?.carVCDidFinishWithCar(model: model, year: correctYear)
        dismiss(animated: true, completion: nil)

        
    }
                
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let i = info[.originalImage] as? UIImage{
            carImage.image = i
        }
        dismiss(animated: true, completion: nil)
    }
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
            
            
        
    func showErrorMsg(){
        let alert = UIAlertController(title: "Error!!", message: "Missing Info", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel,handler: nil)
       
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let CTVC = segue.destination as! CarsTableViewController
//
//        CTVC.carsListFromFVC = appCarCollection!.allCars
//
//    }
    }

