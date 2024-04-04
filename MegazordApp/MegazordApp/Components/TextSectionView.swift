//
//  TextSectionView.swift
//  MegazordApp
//
//  Created by Raphael Ferezin Kitahara on 27/03/24.
//

import SwiftUI

struct TextSectionView: View {
    var description: String
    var icon: String
    var title: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(24)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white.opacity(0.5), lineWidth: 1)
                        .fill(.regularMaterial)
                }
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.body)
                
            }
        }
    }
}

#Preview {
    
    TextSectionView(description: "In this lesson, you'll dive into the world of engineering by building and testing your very own car model.", icon: "magnifyingglass", title: "Introduction")
}
