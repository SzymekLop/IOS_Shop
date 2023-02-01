//
//  Category.swift
//  Sklep
//
//  Created by stud on 19/12/2022.
//

import Foundation

class Category: ObservableObject{
    @Published var name: String
    @Published var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

var superCategories = [
    Category(name: "Bedroom", image: "bedroom"),
    Category(name: "Livingroom", image: "livingroom"),
    Category(name: "Bathroom", image: "bathroom"),
    Category(name: "Kitchen", image: "kitchen"),
    Category(name: "Garden", image: "garden")]
    
var subCategories = [
    Category(name: "Chairs", image: "kitchen_chari"),
    Category(name: "Tables", image: "table"),
    Category(name: "Cupboards", image: "cupboard"),
    Category(name: "Sofas", image: "sofa"),
    Category(name: "Beds", image: "bed"),
    ]
