//
//  ListingDetailView.swift
//  DyreKafe
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let listing: Cafe
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Cafe) {
        self.listing = listing
        
        // Kart: koordinatene fra objektene (DeveloperPreview)
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: listing.latitude,
                longitude: listing.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            // Toppbilde + tilbakeknapp
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.vertical, 48)
                        .padding(.horizontal, 32)
                }
            }
            
            // Info om kafeen
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text(String(format: "%.1f", listing.rating))
                        Text(" - ")
                        Text("98 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            // Host info
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Meet our \(listing.type.description)'s caretaker \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    VStack(alignment: .leading) {
                        Text("Max \(listing.numberOfGuests) guests")
                        Text("\(listing.numberOfPets) furry friends live here")
                        Text("\(listing.numberOfPetsForAdoption) up for adoption")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
            }
            .padding()
            
            Divider()
            
            // Features
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.feature) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Adoption pets
            VStack(alignment: .leading) {
                let pets = listing.petsForAdoption
                if !pets.isEmpty {
                    Text("Our little ones ready for adoption")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24) {
                            ForEach(pets) { pet in
                                VStack {
                                    if let image = UIImage(named: pet.imageUrl) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                    } else {
                                        VStack {
                                            Image(systemName: "pawprint.fill")
                                            Text("No image")
                                                .font(.caption2)
                                                .foregroundStyle(.gray)
                                        }
                                        .frame(width: 80, height: 80)
                                        .overlay {
                                            Circle()
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                    
                                    Text(pet.name)
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                    
                                    Text("\(pet.age) yrs")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    .scrollTargetBehavior(.paging)
                } else {
                    Text("No pets available for adoption right now 🐾")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            
            Divider()
            
            // Amenities
            VStack(alignment: .leading, spacing: 16) {
                Text("What we offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Map
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to \(listing.title)")
                    .font(.headline)
                Text("\(listing.address)")
                
                Map(position: .constant(.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: listing.latitude,
                            longitude: listing.longitude
                        ),
                        span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
                    )
                ))) {
                    Marker(
                        listing.title,
                        coordinate: CLLocationCoordinate2D(
                            latitude: listing.latitude,
                            longitude: listing.longitude
                        )
                    )
                    .tint(.red)
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        } // ScrollView
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Oct 15")
                            Text("16:00")
                        }
                        .fontWeight(.semibold)
                        
                        VStack(alignment: .leading) {
                            Text("No-show fee \(listing.pricePerPerson) kr pp")
                            Text("Price incl. tax")
                        }
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    }
                    
                    Spacer()
                    
                    ReuseableButton(
                        title: "Book Table",
                        backgroundColor: .brown,
                        width: 140
                    )
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    } // body
} // struct

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
