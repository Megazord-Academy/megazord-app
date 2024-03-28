//
//  TextSectionView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TextSectionView<Content: View>: View {
    var sectionTitle: String
    
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(sectionTitle)
                    .font(.title3)
                    .fontWeight(.bold)
                
                content
                
            }
        }
    }
}

#Preview {
    TextSectionView(sectionTitle: "Title") {
        Text("Content")
    }
}
