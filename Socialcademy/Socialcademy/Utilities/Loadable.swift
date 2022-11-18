//
//  Loadable.swift
//  Socialcademy
//
//  Created by Robert Bates on 11/18/22.
//

import Foundation



enum Loadable<Value> {
    case loading
    case error(Error)
    case loaded(Value)
}

extension Loadable where Value: RangeReplaceableCollection {
    static var empty: Loadable<Value> { .loaded(Value()) }
}
