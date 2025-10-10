//
//  DestinationSearchView.swift
//  BookHome
//

import SwiftUI

enum DestinationSearchOption {
    case location
    case dates
    case time
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
    @State private var selectedOption: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 1
    @State private var visitDate = Date()
    @State private var visitTime = Date()
    
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if (!viewModel.searchLocation.isEmpty) {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            
            // Destination Selection View
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Choose a café")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        TextField("Search Café or City...", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Pet Café", description: "Choose a café or city")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            //.frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            .animation(.snappy, value:  selectedOption)
            
            // Data Selection View
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When are you visiting?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        // Velger dato
                        DatePicker("Select a date", selection: $visitDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    CollapsedPickerView(title: "Date", description: "Choose a date")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            //.frame(height: selectedOption == .dates ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            .animation(.snappy, value:  selectedOption)
            
            // Time Selection View
            VStack(alignment: .leading) {
                if selectedOption == .time {
                    Text("When are you coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        // Velger tid
                        DatePicker("Select a time", selection: $visitTime, displayedComponents: .hourAndMinute)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else {
                    CollapsedPickerView(title: "Time", description: "Choose a time")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .time }
            }
            .animation(.snappy, value:  selectedOption)
            
            // Num Guests View
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("How many are visiting?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) \(numGuests == 1 ? "person" : "people")")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 1 else { return }
                        numGuests -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "How many are visiting?")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            .animation(.snappy, value:  selectedOption)
            
            Spacer()
        } // V
    } // body
} // struct DestinationSearchView: View


#Preview {
    DestinationSearchView(
        show: .constant(false),
        viewModel: ExploreViewModel(service: ExploreService()))
}

// Costume Modifier
struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 8)
    }
}


struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
        }
    }
}
