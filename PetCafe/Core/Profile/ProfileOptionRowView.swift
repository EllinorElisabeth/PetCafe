
import SwiftUI

struct ProfileOptionRowView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        
        VStack{
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            } // HStack
            
            Divider()
            
        } // VStack
        
    } // body
} // ProfileOptionRowView

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
