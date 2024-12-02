//
//  Predators.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import Foundation

class Predators {
    var apexPredators: [Dinos] = []
    
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                apexPredators = try decoder.decode([Dinos].self, from: data)
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
