import SwiftUI

struct CategoryCard: View {
    
    var category: Category
    var size: Int

    var body: some View {
        VStack {
            Image(category.image)
                .resizable()
                .frame(width: CGFloat(size), height: CGFloat(200 * (size/210)))
                .cornerRadius(20.0)
            Text(category.name)
                .font(.title3)
                .fontWeight(.bold)
        }
        .frame(width: CGFloat(size))
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}

