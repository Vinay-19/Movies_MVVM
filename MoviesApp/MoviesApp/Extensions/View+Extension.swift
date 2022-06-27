//
//  View+Extension.swift
//  MoviesApp
//
//  Created by Dev on 2022-06-25.


import Foundation
import SwiftUI

extension View{
    func embedNavigationView() -> some View {
        return NavigationView {self}
    }
}
