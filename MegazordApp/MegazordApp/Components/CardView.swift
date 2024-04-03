//
//  CardView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

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
    let icon: String
    let title: String
    
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(spacing: 0) {
            // card title and icon
            HStack(alignment: .center) {
                Image(systemName: icon)
                    .resizable()
                    .font(.title3)
                    .fontWeight(.bold)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(color))
                    }
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(20)
            
            Divider()
            
            // card content
            content
            
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
