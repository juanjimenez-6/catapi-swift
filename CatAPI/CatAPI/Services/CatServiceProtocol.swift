//
//  CatServiceProtocol.swift
//  CatAI
//
//  Created by J on 12/3/24.
//

import Foundation
import Combine

protocol CatServiceProtocol {
    func getRandomCat() -> AnyPublisher<[Cat], Error>
}
