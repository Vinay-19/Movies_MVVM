//
//  MovieListViewModel.swift
//  MoviesApp
//


import Foundation
import SwiftUI



// ObservableObject : This means this particular viewModel can be observed

// Problem: Even though we are assigning values to MovieViewModel (Line 29), The View (UIView) will never no that values has been updated.The View will never know that you have fetched the data from URL using HTTP Client and View need to re-render. This can be done be decorating the property by @Published keyword. @Published means whenever we assign something to our variable like var movies (Line 21), its going to publish a subscription that can be used by someone to update itself. In our case, our view will update itself.

// @Published variable should be assigned values on MAIN UI Thread. [Recommended]

// Displaying the Movies in list view (on UI Screen)

// 1. Search the movie by name
// 2. Got the result.
// 3. Assigning the result to self.movies which is published var
// 4. self.movies is going to tell the View that you need to re-render.

class MovieListViewModel: ViewModelBase {
    
    @Published var movies = [MovieViewModel]()
    
    
    let httpClient = HTTPClient()
    
    func searchByName(name: String){
        
        if name.isEmpty {
            return
        }
        
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()){ result in
            
            switch result {
            case .success(let movies):
                if let movies = movies{
                    
// movies.map(MovieViewModel.init) : This line iterates through movies array one by one (which is the model object) and call the initializer of MovieViewModel to pass the values(title,year, imdbid,poster) in Movie Model to the values (title, year, imdbId, poster) in MovieViewModel
                    
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                self.loadingState = .failed
                }
                
            }
            
            
        }
    }
    
}


// The whole point of MovieViewModel is to provide data to the View so that it can display a particular movie.

struct MovieViewModel {
    
    let movie : Movie // instance of Movie Model
    
    // we want to expose IMBD ID, Title, Poster, Year to the view (UI)
    var imdbId: String {
        movie.imdbid
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
    
}
