//
//  CategoriesView.swift
//  Sklep
//
//  Created by stud on 19/12/2022.
//
import SwiftUI

struct CategoriesView: View {
    
    @StateObject var category: Category = Category(name: " ", image: " ")
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
            ScrollView{
                VStack{
                    Image(category.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Text(category.name)
                        .font(.system(size:34))
    
                    let count = subCategories.count
                    let rowNumber = (Double(count)/2).rounded(.up)
                    ForEach(0 ..< Int(rowNumber)){ column in
                        HStack{
                            ForEach(0 ..< 2){ row in
                                let index = row * 2 + column
                                if index < count{
                                    NavigationLink(
                                        destination: CategoryView(superCategory: category, category: subCategories[index])
                                            .environmentObject(cartManager),
                                        label: {
                                            CategoryCard(category: subCategories[index], size: 180)
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
            }
            .navigationBarItems(trailing: NavigationLink {
                CartView()
                .environmentObject(cartManager)
            } label: {
                CartButton(numberOfProducts: cartManager.products.count, price: cartManager.total)
        })
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(category: Category(name:"Garden", image:" "))
    }
}
