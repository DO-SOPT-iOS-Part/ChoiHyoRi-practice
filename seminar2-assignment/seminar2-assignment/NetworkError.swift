//
//  NetworkError.swift
//  seminar2-assignment
//
//  Created by Hyori Choi on 11/14/23.
//

import Foundation

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case requstEncodingError
    case responseDecodingError
    case responseError
    case unknownError
    case clientError = 400
    case serverError = 500
    case notFoundError = 404
    
    var errorDescription: String {
        switch self {
        case .clientError: return "400:CLIENT_ERROR"
        case .requstEncodingError: return "REQUEST_ENCODING_ERROR"
        case .responseError: return "RESPONSE_ERROR"
        case .responseDecodingError: return "RESPONSE_DECODING_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .serverError: return "500:SERVER_ERROR"
        case .notFoundError: return "404:NOT_FOUND_ERROR"
        }
    }
}
