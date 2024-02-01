import Foundation
import RealmSwift
import SwiftUI

final class NoteRowRealm: Object, ObjectKeyIdentifiable {
    /// The unique ID of the Item. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var noteLabel: String
    
    @Persisted var noteDescription: String
    
    @Persisted var dateCreated: Date

    @Persisted(originProperty: "notesRowsRealm") var group: LinkingObjects<NotesRowsRealmGroup>
    
   
    
}



extension NoteRowRealm {
    
}







