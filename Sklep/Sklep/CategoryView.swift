//
//  CategoryView.swift
//  Sklep
//
//  Created by stud on 23/01/2023.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var superCategory: Category = Category(name: " ", image: " ")
    @StateObject var category: Category = Category(name: " ", image: " ")
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        var list = products.filter{$0.subCategory?.name == category.name}
            ScrollView{
                VStack{
                    Image(category.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Text(category.name)
                        .font(.system(size:34))
                    
                    let count = list.count
                    let rowNumber = (Double(count)/2).rounded(.up)
                    ForEach(0 ..< Int(rowNumber)){ column in
                        HStack{
                            ForEach(0 ..< 2){ row in
                                let index = row * 2 + column
                                if index < count{
                                    NavigationLink(
                                        destination: ProductView(product: list[index])
                                            .environmentObject(cartManager),
                                        label: {
                                            ProductCard(image: list[index].image, product: list[index], size: 180)
                                                .environmentObject(cartManager)
                                        })
                                    .foregroundColor(.black)
                                }
                                else{
                                    Spacer().frame(maxWidth: .infinity)
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count, price: cartManager.total)
                    }
                }
        }
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name:"Bed", image:"restaurant"))
    }
}
