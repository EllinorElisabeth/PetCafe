//
//  SearchAndFilterBar.swift
//  BookHome
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    @Binding var location: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Which Café?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(location.isEmpty ? "Find a pet café -" : "") Pick date & time")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 12)
            Spacer()
            Image(systemName: "magnifyingglass")
                .padding(.trailing, 12)
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
        .overlay {
            Capsule()
            .stroke(lineWidth: 0.5)
            .foregroundColor(Color(.systemGray2))
            .shadow(color: .black.opacity(0.3), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("Oslo"))
}
