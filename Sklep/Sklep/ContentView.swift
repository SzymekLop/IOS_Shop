//
//  ContentView.swift
//  Sklep
//
//  Created by stud on 12/12/2022.
//
import SwiftUI

struct ContentView: View {

    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Furniture Shop")
                        NavigationLink {
                            CartView()
                                .environmentObject(cartManager)
                        }
                        label: {
                            CartButton(numberOfProducts: cartManager.products.count, price: cartManager.total)
                        }
                    }
                        .font(.title)
                    Text("Categories")
                        .font(.custom("Monospace", size: 24))
                        .padding(.horizontal)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            ForEach(0 ..< superCategories.count) { i in
                                NavigationLink(
                                    destination: CategoriesView(category: superCategories[i])
                                        .environmentObject(cartManager),
                                    label: {
                                        CategoryCard(category: superCategories[i], size: 180)
                                            .environmentObject(cartManager)
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                            }
                            .padding(.leading)
                        }
                    }

                    Text("Bestsellers")
                    .font(.custom("Monospace", size: 24))
                    .padding(.horizontal)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            ForEach(0 ..< 4) { i in
                                NavigationLink(
                                    destination: ProductView(product: products[i])
                                    .environmentObject(cartManager),
                                    label: {
                                        ProductCard(image: products[i].image, product: products[i], size: 180)
                                })
                                .navigationBarHidden(true)
                                .foregroundColor(.black)
                            }
                            .padding(.leading)
                        }
                    }
                }
            }
            .navigationTitle(Text("Furniture Shop"))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
