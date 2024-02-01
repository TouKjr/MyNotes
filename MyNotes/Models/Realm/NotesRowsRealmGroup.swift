import Foundation
import RealmSwift
import SwiftUI

/// Represents a collection of items.
final class NotesRowsRealmGroup: Object, ObjectKeyIdentifiable {
    /// The unique ID of the ItemGroup. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId

    /// The collection of Items in this group.
    @Persisted var notesRowsRealm = RealmSwift.List<NoteRowRealm>()
    
}

extension NotesRowsRealmGroup {
    
    static let notesRowsRealmGroup = NotesRowsRealmGroup()
    
    static var CreateRealm: Realm {
        
        var realm: Realm
        
        do {
            realm = try Realm()
            // Check to see whether the in-memory realm already contains an ItemGroup.
            // If it does, we'll just return the existing realm.
            // If it doesn't, we'll add an ItemGroup and append the Items.
            let realmObjects = realm.objects(NotesRowsRealmGroup.self)
            if realmObjects.count > 0 {
//                print("Realm is located at:", realm.configuration.fileURL!)
                return realm
            } else {
                
                try realm.write {
                    
                    notesRowsRealmGroup.notesRowsRealm.append(NoteRowRealm(value: ["id":"\(UUID().uuidString)","noteLabel": "Example Note", "noteDescription": "Swipe left to delete"]))
                    realm.add(notesRowsRealmGroup)
                    
                }
//                print("Realm is located at:", realm.configuration.fileURL!)
                return realm
            }
        } catch let error {
            fatalError("Can't bootstrap item data: \(error.localizedDescription)")
        }
    }
    
}
