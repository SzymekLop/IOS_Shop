//
//  CategoriesView.swift
//  Sklep
//
//  Created by stud on 19/12/2022.
//
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(String(format: "%.2f",cartManager.total)) $")
                        .bold()
                }
                .padding()
                
                
            } else {
                Text("Your cart is empty.")
            }
        }
        .navigationTitle(Text("Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
