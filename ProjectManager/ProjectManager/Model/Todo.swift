//
//  Todo.swift
//  ProjectManager
//
//  Created by Kiseok on 1/25/24.
//
import Foundation

struct Todo: Identifiable, Equatable, Hashable {
    let id: UUID
    let title: String
    let description: String
    let dueDate: Date
}

extension Todo {
    static var sampleData = [
        Todo(
            id: UUID(),
            title: "첫번째",
            description: "내애애용",
            dueDate: Date()
        ),
        Todo(
            id: UUID(),
            title: "두번째",
            description: "내애애용",
            dueDate: Date()
        ),
        Todo(
            id: UUID(),
            title: "세번째",
            description: "내애애용",
            dueDate: Date()
        ),
        Todo(
            id: UUID(),
            title: "네번째",
            description: "내애애용",
            dueDate: Date()
        )
    ]
}
