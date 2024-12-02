//
//  Dinos.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import Foundation

struct Dinos: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
}
