//
//  MainTabView.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 30/09/2025.
//

import SwiftUI

struct MainTabView: View {
        
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")}
            
            WishListsView()
                .tabItem { Label("Wishlists", systemImage: "heart")}
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person")}
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
