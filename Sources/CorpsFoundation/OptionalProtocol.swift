//
//  OptionalProtocol.swift
//  Created by Shawn Throop on 09.02.25.
//

public protocol OptionalProtocol: ExpressibleByNilLiteral {
    
    var isNil: Bool { get }
}


extension Optional: OptionalProtocol {
    
    public var isNil: Bool {
        switch self {
        case .none:
            true
        case .some:
            false
        }
    }
}
