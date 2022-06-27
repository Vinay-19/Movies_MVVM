//
//  Movei.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.
//

import Foundation

struct MovieResponse: Codable{
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
        
    }

}

struct Movie: Codable {
    
    let title: String
    let year: String
    let imdbid: String
    let poster: String
    
    //To map keys in JSON response with our keys defined above, we can use CodingKeys.
    //CodingKeys provide the mapping structure.
    
    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbid = "imdbID"
        case poster = "Poster"
        
        
    }
}
