//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.


import Foundation


extension String {
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)  // trimming all the spaces at the end of text.
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self  //adding %20 between the words.
    }
    
}

