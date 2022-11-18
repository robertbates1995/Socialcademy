//
//  Loadable.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/18/22.
//

import Foundation



enum Loadable<Value> {
    var value: Value? {
        get {
            if case let .loaded(value) = self {
                return value
            }
            return nil
        }
        set {
            guard let newValue = newValue else { return }
            self = .loaded(newValue)
        }
    }
    case loading
    case error(Error)
    case loaded(Value)
}

extension Loadable where Value: RangeReplaceableCollection {
    static var empty: Loadable<Value> { .loaded(Value()) }
}

extension Loadable: Equatable where Value: Equatable {
    static func == (lhs: Loadable<Value>, rhs: Loadable<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.error(error1), .error(error2)):
            return error1.localizedDescription == error2.localizedDescription
        case let (.loaded(value1), .loaded(value2)):
            return value1 == value2
        default:
            return false
        }
    }
}
