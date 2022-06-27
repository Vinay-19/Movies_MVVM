//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.

import SwiftUI

struct MovieListScreen: View {
    
// variable with name movieListVM. Type of this variable is MovieListViewModel
// The reason it is decorated with @ObservedObject is that this object is being observed. If any changes happens to this object, then the View will be rendered.
    
  @ObservedObject private var movieListVM: MovieListViewModel
    
//
  @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            
            
            // Whenever we are typing in textfield, all those values through use of binding are goin to movieName variable.
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                // perform the search
                self.movieListVM.searchByName(name: self.movieName)
                }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .navigationBarTitle("Movies")
            
            
            if self.movieListVM.loadingState == .success {
               
                MovieListView(movies: self.movieListVM.movies)
                
            }else if self.movieListVM.loadingState == .failed {
                
                FailedView()
                
            }
            
            
        }.padding().embedNavigationView()
        
       
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
