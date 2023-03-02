//
//  ImageDownloader.swift
//  ImageLoader
//
//  Created by 이시원 on 2023/03/02.
//

import UIKit

final class ImageDownloader {
  private let urlSession: URLSession
  
  init(urlSession: URLSession = .shared) {
    self.urlSession = urlSession
  }
  
  func downloadImage(url: URL) async throws -> UIImage? {
    let urlRequest = URLRequest(url: url)
    let (data, response) = try await urlSession.data(for: urlRequest)
    guard let response = response as? HTTPURLResponse else {
      throw NetworkError.invalidateResponse
    }
    
    switch response.statusCode {
    case 200..<300: return UIImage(data: data)
    case 400: throw NetworkError.badRequest
    case 401: throw NetworkError.unauthorized
    case 404: throw NetworkError.notFound
    case 500: throw NetworkError.internalServerError
    case 503: throw NetworkError.serviceUnavailable
    default: throw NetworkError.unknown
    }
  }
}

enum NetworkError: LocalizedError {
  case createURLRequestFailure
  case errorIsOccurred(_ error: String)
  case badRequest
  case unauthorized
  case notFound
  case internalServerError
  case serviceUnavailable
  case invalidateResponse
  case unknown

  var errorDescription: String? {
    switch self {
    case .createURLRequestFailure:
      return "잘못된 URL입니다."
    case .errorIsOccurred(let error):
      return "\(error)오류가 발생했습니다."
    case .badRequest:
      return "잘못된 요청입니다."
    case .unauthorized:
      return "유효하지 않은 인증입니다."
    case .notFound:
      return "요청한 페이지를 찾을 수 없습니다."
    case .internalServerError:
      return "현재 서버에 문제가 발생하였습니다."
    case .serviceUnavailable:
      return "현재 서비스 사용이 불가합니다."
    case .invalidateResponse:
      return "유효하지 않은 응답입니다."
    case .unknown:
      return "알 수 없는 오류가 발생했습니다."
    }
  }
}
