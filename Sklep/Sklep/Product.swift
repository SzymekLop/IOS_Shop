//
//  Category.swift
//  Sklep
//
//  Created by stud on 19/12/2022.
//

import Foundation

class Product: ObservableObject, Hashable, Equatable, Identifiable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
    
    @Published var id = UUID()
    @Published var name: String
    @Published var category: Category?
    @Published var image: String
    @Published var price: Double
    @Published var subCategory: Category?
    @Published var desc: String
    
    init(name: String, image: String, price: Double, category: Category? = nil, subCategory: Category? = nil, desc: String = "This is one of our best selling products! 99% of our customares are satisfied with it.") {
        self.name = name
        self.image = image
        self.category = category
        self.subCategory = subCategory
        self.price = price
        self.desc = desc
    }
}

var products = [
        Product(name: "Wooden Chair", image: "restaurant", price: 55.99, category: superCategories[1], subCategory: subCategories[0]),
        Product(name: "Cosy Chair", image: "cosychair", price: 135.99, category: superCategories[1], subCategory: subCategories[0]),
        Product(name: "Boucle Chair", image: "boucle-chair", price: 95.99, category: superCategories[1], subCategory: subCategories[0]),
        Product(name: "Office Chair", image: "office-chair", price: 75.99, category: superCategories[0], subCategory: subCategories[0]),
        Product(name: "Big Chair", image: "garden-chair", price: 175.99, category: superCategories[4], subCategory: subCategories[0]),
        Product(name: "Rosalia Chair", image: "rosalia-chair", price: 275.99, category: superCategories[1], subCategory: subCategories[0]),
        Product(name: "Luxury Chair", image: "green_chair", price: 149.99, category: superCategories[1], subCategory: subCategories[0]),
        Product(name: "Round Table", image: "round-table", price: 95.99, category: superCategories[1], subCategory: subCategories[1]),
        Product(name: "Long Table", image: "table", price: 75.99, category: superCategories[1], subCategory: subCategories[1]),
        Product(name: "Square Table", image: "square-table", price: 175.99, category: superCategories[1], subCategory: subCategories[1]),
        Product(name: "Golden Table", image: "glden-table", price: 275.99, category: superCategories[1], subCategory: subCategories[1]),
        Product(name: "Wooden Table", image: "wooden-table", price: 149.99, category: superCategories[1], subCategory: subCategories[1])
        ]

