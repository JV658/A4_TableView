//
//  Movies.swift
//  A4_TableView
//
//  Created by Cambrian on 2023-03-22.
//

import Foundation

class MovieList {
    var movies = [Movie]()
    
    // Do not modify this init method. it is used to add default movies to your movies array
    init(){
        if let url = Bundle.main.url(forResource: "movie", withExtension: "json"){
            do {
                
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()
                
                let results = try decoder.decode(Movies.self, from: data)
                
                movies = results.movies
                                
            } catch {
                   fatalError("cannot convert JSON to movies: \(error)")
            }
        } else {
            print("something went wrong when geting url")
        }
    }
}
