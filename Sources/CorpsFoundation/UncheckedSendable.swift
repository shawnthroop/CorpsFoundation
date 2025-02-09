//
//  UncheckedSendable.swift
//  Created by Shawn Throop on 22.02.25.
//

/// A wrapper designed to impart Sendable conformance to a non-Sendbale type Value.
///
@propertyWrapper public struct UncheckedSendable<Value> : @unchecked Sendable {
    
    public let wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public var projectedValue: UncheckedSendable<Value> {
        self
    }
}

public extension UncheckedSendable {
    
    init(_ wrappedValue: Value) {
        self.init(wrappedValue: wrappedValue)
    }
}

public typealias UncheckedHashable<T: Hashable> = UncheckedSendable<T>


extension UncheckedSendable: Hashable where Value: Hashable {}
extension UncheckedSendable: Equatable where Value: Equatable {}

extension UncheckedSendable: Comparable where Value: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.wrappedValue < rhs.wrappedValue
    }
}

extension UncheckedSendable: Encodable where Value: Encodable {
    
    public func encode(to encoder: any Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

extension UncheckedSendable: Decodable where Value: Decodable {
    
    public init(from decoder: any Decoder) throws {
        self.init(wrappedValue: try Value(from: decoder))
    }
}
