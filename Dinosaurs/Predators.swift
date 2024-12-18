//
//  Predators.swift
//  Dinosaurs
//
//  Created by Patryk Knopp on 02/12/2024.
//

import Foundation

class Predators {
    var allPredators: [Dinos] = []
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
                
                allPredators = try decoder.decode([Dinos].self, from: data)
                apexPredators = allPredators
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func search (for searchTerm: String) -> [Dinos] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool){
        apexPredators.sort{
            predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: PredatorType){
        if type == .all {
            apexPredators = allPredators
        }else{
            apexPredators = allPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
