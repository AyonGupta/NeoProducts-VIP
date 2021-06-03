
import Foundation
enum ApiResponse<T> {
    case success(value: T)
    case failure(error: Error)
}
enum APIStatusCode:Int {
    case success = 200
    case failure = 401
}
