//
//  Box.swift
//  Created by Shawn Throop on 03.01.25.
//

@propertyWrapper public final class Box<Value> {
    
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public var projectedValue: Box<Value> {
        self
    }
}


public extension Box {
    
    convenience init(_ wrappedValue: Value) {
        self.init(wrappedValue: wrappedValue)
    }
    
    convenience init() where Value: OptionalProtocol {
        self.init(wrappedValue: nil)
    }
}
