//
//  Profile.swift
//  BookHome
//
//  Created by Ellinor Elisabeth Helgesen on 30/09/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
            
            // profile log in view
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 8) { // Profile + Log in to start...
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    Text("Log in to plan you visit or future adoption")
                } // Profile txt - V
                
                ReuseableButton(
                    title: "Log in",
                    backgroundColor: .brown,
                    width: 360
                )
                
                HStack { // Don't have account txt
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                } // Don't have account txt - H
                .font(.caption)
            }
            
            // profile options
            VStack(spacing: 24) {
                
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")
                
            }
            .padding(.vertical)
            
        } // V
        .padding()
    } // body
} // ProfileView

#Preview {
    ProfileView()
}
