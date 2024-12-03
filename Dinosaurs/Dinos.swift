//
//  Dinos.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import Foundation
import SwiftUI

struct Dinos: Decodable, Identifiable {
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
    
    struct MovieScene: Decodable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum PredatorType: String, Decodable {
        case land
        case air
        case sea
        
        var background: Color {
            switch self {
            case .land:
                    .brown
            case .air:
                    .gray
            case .sea:
                    .cyan
            }
        }
    }
    
}
