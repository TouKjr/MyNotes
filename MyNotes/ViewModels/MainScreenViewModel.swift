//
//  MainScreenViewModel.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import Foundation
import SwiftUI
import RealmSwift

class MainScreenViewModel: ObservableObject{
    
    @ObservedRealmObject var notesRowsRealmGroup: NotesRowsRealmGroup
    @Published var notesCount: Int?
    
    init(){
        let realm = NotesRowsRealmGroup.CreateRealm
        let noteRowRealmGroupObject = realm.objects(NotesRowsRealmGroup.self)
        self.notesRowsRealmGroup = noteRowRealmGroupObject.first!
        self.notesCount = notesRowsRealmGroup.notesRowsRealm.count
    }
    
    func addNote(noteText:String){
        
        defer{notesCount = notesRowsRealmGroup.notesRowsRealm.count}
        
        let newTask = NoteRowRealm(value: ["id":"\(UUID().uuidString)","noteLabel": "\(noteText)", "noteDescription": ""])
        
        $notesRowsRealmGroup.notesRowsRealm.append(newTask)
        
        
        
    
    }
    
    func deleteNote(_ DeletedNote: NoteRowRealm){
        
        defer{notesCount = notesRowsRealmGroup.notesRowsRealm.count}
        
//        print(DeletedNote)
        
        let realm = try! Realm()
        try! realm.write {
            let isDeletedTasks = realm.objects(NoteRowRealm.self).where {
                $0._id == DeletedNote._id
            }
            realm.delete(isDeletedTasks)
        }
        
    
    }
    
    
    
}
