 

import Foundation

// Decodable Extension
extension Decodable {
    /*
     * Method name: decode
     * Description: use to decode object
     * Parameters: data refer Data
     * Return:  return owner object
     */
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

// Encodable Extension
extension Encodable {
    /*
     * Method name: encode
     * Description: use to decode object
     * Parameters: -
     * Return:  return data
     */
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

 extension KeyedDecodingContainer {
     /*
     * Method name: decodeSafelyIfPresent
     * Description: Used to decode for the particular key if present
     * Parameters: key refers to type KeyedDecodingContainer
     * Return:  T refers to type of object
     */
     public func decodeSafelyIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) -> T? {
         return self.decodeSafelyIfPresent(T.self, forKey: key)
     }
    /*
     * Method name: decodeSafelyIfPresent
     * Description: Used to decode for the particular key if present
     * Parameters: T
     * Return:  T refers to type of object
     */
     public func decodeSafelyIfPresent<T: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? {
         let decoded = ((try? decodeIfPresent(SafeProcess<T>.self, forKey: key)) as SafeProcess<T>??)
         return decoded??.value
     }
 }
 /*
  * Method name: SafeProcess
  * Description: Used to safely read value
  * Parameters: Decodable
  * Return:  return Decodable object
  */
 public struct SafeProcess<Base: Decodable>: Decodable {
     public let value: Base?
     public init(from decoder: Decoder) throws {
         do {
             let container = try decoder.singleValueContainer()
             self.value = try container.decode(Base.self)
         } catch {
             self.value = nil
         }
     }
 }
