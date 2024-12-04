//
//  Dinos.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import Foundation
import SwiftUI
import MapKit

struct Dinos: Decodable, Identifiable{
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable, Identifiable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    

    
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: PredatorType {
        self
    }
    
    var background: Color {
        switch self {
        case .land:
                .brown
        case .air:
                .gray
        case .sea:
                .cyan
        case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
