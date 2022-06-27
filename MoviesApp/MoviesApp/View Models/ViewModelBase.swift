//
//  ViewModelBase.swift
//  MoviesApp
//
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}


class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
