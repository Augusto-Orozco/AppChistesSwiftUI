//
//  PhotoViewModel.swift
//  Foto
//
//  Created by Alumno on 01/10/25.
//

import Foundation
internal import Combine

@MainActor
@Observable
class PhotoViewModel {
    var arrPhotos = [Photo]()
    var jokes: [Joke] = []
    
    func getPhotosNasa() async throws {
        
        //1. URL
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?lang=es&blacklistFlags=nsfw,religious,political,racist,sexist,explicit&amount=10") else {
            print("Invalid url")
            return
        }
        
        //2. Request
        let urlRequest = URLRequest(url: url)
        
        //3. Call http
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Error")
            return
        }
        
        //4. Decode JSON
        do {
            let decoder = JSONDecoder()
            let jokesResponse = try decoder.decode(Photo.self, from: data)
            self.jokes = jokesResponse.jokes
        } catch {
            print("Error al decodificar: \(error)")
        }

    }
}
