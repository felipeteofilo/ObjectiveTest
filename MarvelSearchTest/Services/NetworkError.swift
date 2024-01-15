//
//  NetworkError.swift
//  MarvelSearchTest
//
//  Created by Leticia Sobral on 14/01/24.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
