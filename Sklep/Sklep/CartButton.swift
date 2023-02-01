//
//  CartButton.swift
//  Sklep
//
//  Created by stud on 01/02/2023.
//

import Foundation
import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    var price: Double

    var body: some View {
        HStack{
            Text("$\(String(format: "%.2f",price))")
                .font(.caption2).bold()
                .foregroundColor(.white)
                .frame(width: 60, height: 30)
                .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .cornerRadius(40)
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart")
                    .padding(.top, 5)
                if numberOfProducts > 0 {
                    Text("\(numberOfProducts)")
                        .font(.caption2).bold()
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                        .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .cornerRadius(50)
                }
                
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1, price: 0.0)
    }
}
