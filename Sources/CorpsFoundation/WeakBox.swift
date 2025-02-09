//
//  WeakBox.swift
//  Created by Shawn Throop on 03.01.25.
//

@propertyWrapper public final class WeakBox<Value: AnyObject> {
    
    public weak var wrappedValue: Value?
    
    public init(wrappedValue: Value? = nil) {
        self.wrappedValue = wrappedValue
    }
    
    public var projectedValue: WeakBox<Value> {
        self
    }
}


public extension WeakBox {
    
    convenience init(_ wrappedValue: Value) {
        self.init(wrappedValue: wrappedValue)
    }
}

