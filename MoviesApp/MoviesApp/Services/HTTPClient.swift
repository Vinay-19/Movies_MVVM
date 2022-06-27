//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.


//Whole purpose of HTTP client is make request to OMDB API Url get the response JSON. Convert the JSON through model and give us the result in terms of keys specified in Model.


import Foundation

enum CFNetworkErrors: Error{
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    // This function will search movies and it will fire completion handler once API call task finished.
    
    // Completion handler will provide Movies Response in case of success and error in case of failure.
    
    // This function will be asynchronous request, which will be eventually going to be completed in future that's why we are passing completion handler closure which will be called later when request is done.
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,CFNetworkErrors>) -> Void){
        
        guard let url = URL.forMoviesByName(name: search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else{
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
            
        }.resume()
        
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail,CFNetworkErrors>) -> Void){
        
        guard let url = URL.forMoviesByImdbId(imdbId: imdbId) else {
            return completion(.failure(.badURL))
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else{
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
            
        }.resume()
        
        
        
    }
    
    
    
    
}
