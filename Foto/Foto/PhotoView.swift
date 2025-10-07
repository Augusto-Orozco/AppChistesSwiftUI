//
//  PhotoView.swift
//  Foto
//

import SwiftUI

struct PhotoView: View {
    @State var photoVM = PhotoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 15) {
                    Text("Chistes del día")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Chistes de programación y algo más")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            
            List(photoVM.jokes) { joke in
                NavigationLink(destination: JokeDetailView(joke: joke)) {
                    VStack(alignment: .leading) {
                        Text(joke.category)
                            .font(.headline)
                    }
                    .padding(.vertical, 15)
                }
            }
            .task {
                do {
                    try await photoVM.getPhotosNasa()
                } catch {
                    print("Error al obtener datos: \(error)")
                }
            }
        }
    }
}

#Preview {
    PhotoView()
}

