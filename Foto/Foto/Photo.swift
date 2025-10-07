//
//  Photo.swift
//  Foto
//
//  Created by Alumno on 01/10/25.
//

import Foundation

struct Photo: Decodable {
    let error: Bool
    let amount: Int
    let jokes: [Joke]
    
    enum CodingKeys: String, CodingKey {
        case error
        case amount
        case jokes
    }
}

struct Joke: Decodable, Identifiable {
    let id: Int
    let category: String
    let type: JokeType
    let setup: String?
    let delivery: String?
    let joke: String?
    let flags: Flags
    let safe: Bool
    let lang: String

    enum CodingKeys: String, CodingKey {
        case id
        case category
        case type
        case setup
        case delivery
        case joke
        case flags
        case safe
        case lang
    }
}

struct Flags: Decodable {
    let nsfw: Bool
    let religious: Bool
    let political: Bool
    let racist: Bool
    let sexist: Bool
    let explicit: Bool?

    enum CodingKeys: String, CodingKey {
        case nsfw
        case religious
        case political
        case racist
        case sexist
        case explicit
    }
}

enum JokeType: String, Decodable {
    case single
    case twopart
}
