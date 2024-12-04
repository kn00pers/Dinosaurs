//
//  PredatorDetail.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 04/12/2024.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    let predator: Dinos
    
    @State var position: MapCameraPosition
        var body: some View {
            GeometryReader {geo in
                ScrollView{
                    ZStack(alignment: .bottomTrailing){
                        //background image
                        Image(predator.type.rawValue)
                            .resizable()
                            .scaledToFill()
                            .overlay{
                                LinearGradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.66),
                                    Gradient.Stop(color: .black, location: 1)
                                ], startPoint: .top, endPoint: .bottom)
                            }
                        //dino image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                            .scaleEffect(x: -1)
                            .shadow(color: .black, radius: 8)
                            .offset(y: 20)
                    }
                    VStack(alignment: .leading){
                        // name
                        Text(predator.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        // currenct location
                        NavigationLink{
                            PredatorMap(position:.camera(MapCamera(centerCoordinate: predator.location, distance: 1000, heading: 250 , pitch: 50)))
                        } label: {
                            Map(position: $position){
                                Annotation(predator.name, coordinate: predator.location){
                                    Image(systemName: "mappin.and.ellipse")
                                        .font(.largeTitle)
                                        .symbolEffect(.pulse)
                                }
                                .annotationTitles(.hidden)
                            }
                            .frame(height: 125)
                            .clipShape(.rect(cornerRadius: 15))
                            .overlay(alignment: .trailing){
                                Image(systemName: "greaterthan")
                                    .padding(.horizontal, 10)
                                    .imageScale(.large)
                                    .font(.title3)
                            }
                        }
                        // list of movies
                        Text("Movies appearence:")
                            .font(.title)
                            .padding(.top, 15)
                            .padding(.horizontal, 5)
                        ForEach(predator.movies, id: \.self) {
                            movie in
                            Text("•" + movie)
                                .font(.title3)
                                .padding(.horizontal, 5)
                                .padding(.top, 5)
                            
                        }
                        // movie scenes
                        Text("Movie moments:")
                            .font(.title)
                            .padding(.top, 15)
                            .padding(.horizontal, 5)
                        ForEach(predator.movieScenes){
                            scene in
                            Text("•" + scene.movie)
                                .font(.title2)
                                .padding(.top, 10)
                                .padding(.horizontal, 5)
                            Text(scene.sceneDescription)
                                .padding(.horizontal, 10)
                        }
                        // the link
                        Link("Read more",
                             destination: URL(string: predator.link)!)
                        .padding(.horizontal, 5)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 5)
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                    }
                }
            .ignoresSafeArea()
            }
            .toolbarBackground(.automatic)
            
            
            
    }
}

#Preview {
    NavigationStack{
        PredatorDetail(predator: Predators().apexPredators[10], position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[10].location, distance: 30000)))
            .preferredColorScheme(.dark)
    }
}
