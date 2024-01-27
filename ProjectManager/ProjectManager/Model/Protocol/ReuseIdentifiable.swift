//
//  ReuseIdentifiable.swift
//  ProjectManager
//
//  Created by Kiseok on 1/24/24.
//

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
