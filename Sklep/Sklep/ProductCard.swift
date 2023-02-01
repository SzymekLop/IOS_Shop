
import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var image : String
    var product: Product
    var size: Int
    
    var body: some View {
        VStack{
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
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

