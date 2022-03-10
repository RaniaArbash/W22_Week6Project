//
//  CarsTableViewController.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

import UIKit

class CarsTableViewController: UITableViewController,
                               AddCarDelegate  {
        
    
    
   

    var appCarCollection : CarCollection?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCarCollection = (UIApplication.shared.delegate as! AppDelegate).carCollection
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appCarCollection?.allCars.count)!
    }
    
    @IBAction func changeColorClicked(_ sender: Any) {
        
        view.layer.backgroundColor = UIColor.red.cgColor
   
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarTableViewCell

        cell.carModel.text = appCarCollection?.allCars[indexPath.row].model
        
        if let year = appCarCollection?.allCars[indexPath.row].year{
            cell.carYear.text = "\(year)"
        }
        
        cell.carImage.image = UIImage.init(named: "carimg")
        return cell
   
    }
    
    func carVCDidFinishWithCar(model: String, year: Int) {
        appCarCollection?.addNewCar(m: model, y: year)
        tableView.reloadData()
        let alert = UIAlertController(title: "Car Added!!", message: "Thank You", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { action in
                           
                }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)

    }
    
    func carVCDidFinishWithCancel() {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.delegate = self
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
