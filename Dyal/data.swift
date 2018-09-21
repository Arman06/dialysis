//
//  data.swift
//  Dyal
//
//  Created by Арман on 9/16/18.
//  Copyright © 2018 Арман. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private(set) var foodArray = [
        foodItem(name: "Яблоко", imageName: "apple.jpg", potassium: 107, sodium: 1),
        foodItem(name: "Ананас", imageName: "pineapple.jpg", potassium: 109, sodium: 1),
        foodItem(name: "Апельсин", imageName: "orange.jpg", potassium: 181, sodium: 0),
        foodItem(name: "Персик", imageName: "peach.jpg", potassium: 190, sodium: 0),
        foodItem(name: "Банан", imageName: "banana.jpg", potassium: 358, sodium: 1),
        foodItem(name: "Лимон", imageName: "lemon.jpg", potassium: 138, sodium: 2)
    ]
    
    func addFood(_ food: foodItem) {
        foodArray.append(food)
    }
    func getFood() -> [foodItem] {
        return foodArray
    }
}
