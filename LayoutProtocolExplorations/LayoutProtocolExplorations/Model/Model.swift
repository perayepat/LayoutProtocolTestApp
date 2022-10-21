//
//  Model.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//



import SwiftUI

/// Storage for pet data.
///
/// This model keeps a collection of ``Pet`` instances in the ``pets`` array.
/// Each element tracks the vote count for a particular pet type. You can
/// get summary information about the collection, like the total
/// votes in the ``totalVotes`` property, and the rank of a specified pet
/// using the ``rank(_:)`` method.
///
/// To extend this app, you might share this model data in iCloud among a
/// group of your app's users.
class Model: ObservableObject {
    
    /// The pets that people can vote for.
    ///
    /// The model supports any number of pets, but parts of the app's user
    /// interface, especially the ``Profile`` view, work only for exactly three
    /// pets.
    @Published var foods: [Food]

    /// Creates a new model object with the given set of pets.
    init(foods: [Food]) {
        self.foods = foods
    }

    /// The sum of all votes across all pets.
    var totalVotes: Int { foods.reduce(0) { $0 + $1.votes } }

    /// A Boolean value that indicates whether all the pets have the same
    /// number of votes.
    var isAllWayTie: Bool {
        foods.allSatisfy { $0.votes == foods.first?.votes }
    }

    /// Calculates the rank of the specified pet.
    ///
    /// Because this method calculates the rank as the number of pets that have
    /// more votes than the specified pet, pets with the same number of votes
    /// have the same rank, resulting in a tie.
    func rank(_ food: Food) -> Int {
        foods.reduce(1) { $0 + (($1.votes > food.votes) ? 1 : 0) }
    }
}

extension Model {
    /// A model instance to use for running the app, starting with zero votes
    /// for each contender.
    static var startData: Model = Model(foods:[
        Food(type: "Burger", image: "Burger", color:"ffe8d6"),
        Food(type: "Donut", image: "Donut", color:"ffe8d6"),
        Food(type: "Soft Drink", image: "Drink", color:"ffe8d6")
    ])

    /// A model instance to use for previews.
    ///
    /// This preview data assigns each pet the number of votes that matches its
    /// index to ensure that the preview looks the same all the time.
    /// If you prefer random data, use something like the following instead:
    ///
    /// ```swift
    /// model.pets[index].votes = Int.random(in: 0...100)
    /// ```
    static var previewData: Model {
        let model = startData
        for index in model.foods.indices {
            model.foods[index].votes = index
        }
        return model
    }
}
