//
//  TopMoviesView.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import SwiftUI
import Kingfisher

struct TopMoviesView: View {
    
    @ObservedObject var viewModel: TopMoviewViewModel = TopMoviewViewModel()
    
    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("Top rated movies")
                .onAppear {
                    viewModel.loadMovies()
                }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .loading, .initial:
            ProgressView()
        case .moviesLoaded(let movies):
            getMovieListView(with: movies)
            
        case .failure(let error):
            getErrorView(for: error)
        }
    }
    
    private func getMovieListView(with movies: [Movie]) -> some View {
        GeometryReader { geo in
            List(movies) { movie in
                ZStack {
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        EmptyView()
                    }
                    .opacity(0)
                    
                    DownsampledKFImage(
                        url: movie.posterURL,
                        size: CGSize(
                            width: geo.size.width,
                            height: 700
                        ),
                        cornerRadius: 10
                    )
                    .shadow(radius: 1, x: 1, y: 1)
                }
            }
        }
        .listStyle(.plain)
    }
    
    private  func getErrorView(for error: Error) -> some View {
        VStack {
            Text(error.localizedDescription)
            Button {
                viewModel.loadMovies()
            } label: {
                Text("Retry")
            }
        }
    }
}

struct TopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviesView()
    }
}
