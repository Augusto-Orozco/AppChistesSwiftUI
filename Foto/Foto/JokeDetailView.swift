//
//  JokeDetailView.swift
//  Foto
//

import SwiftUI

struct JokeDetailView: View {
    let joke: Joke
    @State private var randomCatImage: String = ""
        private let catImages = ["Gato1", "Gato2", "Gato3", "Gato4"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 17) {
                Text(joke.category)
                    .font(.largeTitle)
                    .frame(alignment: .center)
                    .bold()
                
                Divider()
                
                if joke.type == .twopart {
                    VStack(alignment: .center, spacing: 10) {
                        Text(joke.setup ?? "")
                            .font(.title3)
                            .foregroundColor(.primary)
                        Text(joke.delivery ?? "")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                            
                    }
                } else if let singleJoke = joke.joke {
                    Text(singleJoke)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                } else {
                    Text("Sin contenido disponible.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                if !randomCatImage.isEmpty {
                                Image(randomCatImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .transition(.opacity)
                                    .animation(.easeInOut(duration: 0.6), value: randomCatImage)
                            }
                
            }
            .padding()
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
                    randomCatImage = catImages.randomElement() ?? "Gato1"
                }
        
    }
}




#Preview {
    JokeDetailView(
        joke: Joke(
            id: 1,
            category: "Programming",
            type: .twopart,
            setup: "¿Por qué C consigue todas las chicas?",
            delivery: "Porque no las trata como objetos.",
            joke: nil,
            flags: Flags(nsfw: false, religious: false, political: false, racist: false, sexist: false, explicit: false),
            safe: true,
            lang: "es"
        )
    )
}

