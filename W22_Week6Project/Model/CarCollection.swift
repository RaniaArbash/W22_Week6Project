//
//  CarCollection.swift
//  W22_Week6Project
//
//  Created by Rania Arbash on 2022-02-17.
//

import Foundation

class CarCollection {
    var allCars : [Car] = [Car]()
    
    func addNewCar(m: String, y: Int){
        allCars.append(Car(m: m, y: y))
    }
}
