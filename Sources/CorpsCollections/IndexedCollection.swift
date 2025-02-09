//
//  IndexedCollection.swift
//  Created by Shawn Throop on 09.02.25.
//

public extension Collection {
    
    var indexed: IndexedCollection<Self> {
        .init(self)
    }
}

public struct IndexedCollection<Base: Collection> : Collection {
    
    public typealias Index = Base.Index
    public typealias Indices = Base.Indices
    public typealias Element = (index: Base.Index, element: Base.Element)
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
    
    
    public var indices: Indices {
        base.indices
    }
    
    public var startIndex: Index {
        base.startIndex
    }
    
    public var endIndex: Index {
        base.endIndex
    }
    
    public func index(after i: Index) -> Index {
        base.index(after: i)
    }
    
    public func formIndex(after i: inout Index) {
        base.formIndex(after: &i)
    }
    
    public func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }
    
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
        base.index(i, offsetBy: distance, limitedBy: limit)
    }
    
    public func distance(from start: Index, to end: Index) -> Int {
        base.distance(from: start, to: end)
    }
    
    public var isEmpty: Bool {
        base.isEmpty
    }
    
    public var underestimatedCount: Int {
        base.underestimatedCount
    }
    
    public var count: Int {
        base.count
    }
    
    public subscript(position: Index) -> Element {
        (position, base[position])
    }
}


extension IndexedCollection: BidirectionalCollection where Base: BidirectionalCollection {
    
    public func index(before i: Index) -> Index {
        base.index(before: i)
    }
    
    public func formIndex(before i: inout Index) {
        base.formIndex(before: &i)
    }
}


extension IndexedCollection: RandomAccessCollection where Base: RandomAccessCollection { }
