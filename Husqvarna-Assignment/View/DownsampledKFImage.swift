//
//  DownsampledKFImage.swift
//  Husqvarna-Assignment
//
//  Created by Mayur Deshmukh on 2022-10-12.
//

import SwiftUI
import Kingfisher

struct DownsampledKFImage: View {
    private let url: URL?
    private let size: CGSize
    private let cornerRadius: CGFloat
    
    init(url: URL?, size: CGSize, cornerRadius: CGFloat = 0) {
        self.url = url
        self.size = size
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        KFImage(url)
            .setProcessors(
                [
                    DownsamplingImageProcessor(size: size),
                    RoundCornerImageProcessor(cornerRadius: cornerRadius)
                ]
            )
            .cacheOriginalImage()
            .scaleFactor(UIScreen.main.scale)
            .placeholder { _ in
                ProgressView()
            }
            .fade(duration: 0.2)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(cornerRadius)
    }
}

struct DownsampledKFImage_Previews: PreviewProvider {
    static var previews: some View {
        DownsampledKFImage(
            url: URL(string: "https://image.tmdb.org/t/p/original/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg"),
            size: CGSize(width: 375, height: 400),
            cornerRadius: 24
        )
    }
}
