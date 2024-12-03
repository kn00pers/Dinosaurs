//
//  ContentView.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    var filteredDinos: [Dinos] {
        if searchText.isEmpty {
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter { predator in
                
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) { predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label:{
                    HStack{
                        // image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 3)
                        VStack(alignment: .leading){
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            //type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                            
                        }
                    }
                }
            }
            .navigationTitle("Dinosaurs")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
