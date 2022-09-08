//
//  ShoppingItem.swift
//  SwiftUI-GroceryApp-RealmDB
//
//  Created by Reşat Kut on 4.09.2022.
//

import Foundation
import RealmSwift



class ShoppingItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    @Persisted var category: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
