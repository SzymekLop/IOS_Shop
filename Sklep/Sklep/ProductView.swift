//
//  ProductView.swift
//  Sklep
//
//  Created by stud on 23/01/2023.
//

import SwiftUI

struct ProductView: View{
    
    @StateObject var product: Product = Product(name: " ", image: " ", price: 0)
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView{
            VStack{
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                }
                    .buttonStyle(.bordered)
                    .background(.blue)
                    .cornerRadius(50)
                    .padding(12)
                ScrollView{
                    Text(String(product.price))
                        .font(.custom("Monospace", size: 24))
                    Spacer()
                    Text(product.desc)
                }
                .navigationTitle(Text(product.name))
            }
            .frame(maxWidth: .infinity)
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
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
