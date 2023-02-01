
import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var size: Int
    
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .frame(width: CGFloat(size), height: CGFloat(200 * (size/210)))
                .cornerRadius(20.0)
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(String(product.price))
        }
        .frame(width: CGFloat(size))
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

