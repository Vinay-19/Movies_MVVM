//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.


import Foundation

extension URL {
    
    // Created Extension of URL to place URLS(or APIs) in one file. This will make our codebase modular.
    
    static func forMoviesByImdbId(imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
}
