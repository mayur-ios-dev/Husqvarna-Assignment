//
//  TopMoviewViewModel.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-12.
//

import Foundation

import Combine

final class TopMoviewViewModel: ObservableObject {
    private var movieApi: MovieAPIType
    
    @Published var state: State = .initial
    private var subscriptions: [AnyCancellable] = []
    
    init(movieApi: MovieAPIType = MovieAPI()) {
        self.movieApi = movieApi
    }
    
    func loadMovies() {
        state = .loading
        movieApi.getTopRatedMovies()
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else { return }
                self?.state = .failure(error)
            } receiveValue: { [weak self] resonse in
                let movies = Array(resonse.movies.prefix(10))
                self?.state = .moviesLoaded(movies)
            }
            .store(in: &subscriptions)
    }
}

extension TopMoviewViewModel {
    enum State {
        case initial
        case loading
        case moviesLoaded([Movie])
        case failure(Error)
    }
}
