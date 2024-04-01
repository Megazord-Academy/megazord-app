import SwiftUI

/// You create a card by providing a `color` and a`title` for it. The card `content` is the content that will be displayed inside the card
///
/// Example of how to use this view:
///
///     CardView(color: "Purple", title: "Robot Status") {
///         VStack(alignment: .leading) {
///             Text("Text inside the card")
///             Spacer()
///         }
///         .padding()
///
///     }
///
struct CardView<Content: View>: View {
    let color: String
    let title: String
    
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(spacing: 0) {
            // card title
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(20)
            .background(Color(color)) // title background color
            
            // card content
            content
            
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
