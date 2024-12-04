//
//  PredatorMap.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 04/12/2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    var body: some View {
        Map(position: $position){
            ForEach(predators.apexPredators){
                predator in
                Annotation(predator.name, coordinate: predator.location){ Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 5)
                        .scaleEffect(x: -1)
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation:.realistic))
        .overlay(alignment: .bottomTrailing){
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 250 , pitch: 50))
    )
        .preferredColorScheme(.dark)
}