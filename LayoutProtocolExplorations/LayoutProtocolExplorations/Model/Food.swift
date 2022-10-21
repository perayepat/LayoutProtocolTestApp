//
//  Model.swift
//  LayoutProtocolExplorations
//
//  Created by Pat on 2022/10/21.
//

import SwiftUI



struct Food: Identifiable, Equatable{
    /// The name of the pet's type, like cat or dog.
    let type: String
    /// A color to use for the food's avatar.
    let image: String
    
    let color: String
    /// The total votes that the pet has received.
    var votes: Int = 0

    var id: String { type }
    
}
