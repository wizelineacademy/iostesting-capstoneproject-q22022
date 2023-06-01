//
//  Observer.swift
//  Capstone
//
//  Created by Carlos Ceja.
//

import Foundation

protocol Observable {
    associatedtype ObservedObject
    typealias Subscriber = (ObservedObject?) -> ()
    var value: ObservedObject? { get }
    var subscriber: Subscriber? { get }

    func updateValue(with newValue: ObservedObject?)
    func bind(_ subscriber: Subscriber?)
}

class Observer<T>: Observable {
    typealias ObservedObject = T

    private var _value: ObservedObject?
    private(set) var subscriber: Subscriber?

    private(set) var value: ObservedObject? {
        get { _value }
        set {
            _value = newValue
            subscriber?(newValue)
        }
    }

    func updateValue(with newValue: T?) {
        self.value = newValue
    }

    func bind(_ subscriber: Subscriber?) {
        self.subscriber = subscriber
    }

}
