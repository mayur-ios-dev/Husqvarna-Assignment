//
//  MovieDetailsView.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-11.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    var movie: Movie
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                headerView
                    .padding(.leading)
                
                DownsampledKFImage(
                    url: movie.backdropURL,
                    size: CGSize(width: geo.size.width, height: 200)
                )
                
                overview
                
                Spacer()
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(movie.title)
                .font(.largeTitle)
            HStack {
                Text(movie.releaseYear)
                    .font(.subheadline)
                    .padding(.trailing)
                Divider()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .padding(.leading, 4)
                Text("**\(movie.voteAverage.roundedString)** (\(movie.voteCount))")
                    .font(.subheadline)
            }
            .frame(height: 30)
        }
    }
    
    private var overview: some View {
        VStack {
            HStack(alignment: .top) {
                DownsampledKFImage(
                    url: movie.posterURL,
                    size: CGSize(width: 100, height: 500)
                )
                .frame(width: 100)
                
                Text(movie.overview)
                    .font(.caption)
            }
            .padding(.leading)
            .padding(.trailing)
            
            Divider()
        }
    }
}

private extension Double {
    var roundedString: String {
        String(format: "%.1f", self)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(
            movie: Movie(
                backdropPath: "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
                id: 238,
                originalTitle: "The Godfather",
                overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
                posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                releaseDate: Date(),
                title: "The Godfather",
                voteAverage: 8.7,
                voteCount: 16711
            )
        )
    }
}
