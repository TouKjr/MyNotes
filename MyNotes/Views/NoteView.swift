//
//  NoteView.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import SwiftUI
import RealmSwift

struct NoteView: View {
    
    @ObservedRealmObject var currentNote: NoteRowRealm
    
    var body: some View {
        ZStack{
            TextEditor(text: $currentNote.noteDescription)
        }
        .padding()
        .navigationTitle(currentNote.noteLabel)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                alertTF(title: "New label",
                        message: nil,
                        hintText: "Note's label",
                        primaryTitle: "Edit",
                        secondaryTitle: "Cancel",
                        primaryAction: { text in
                    
                    let realm = try! Realm()
                    try! realm.write {
                        currentNote.thaw()?.noteLabel = text
                        
                    }
                },
                        secondaryAction: {}
                )
            },
                   label: {
                Text("Edit Label")
            })
        }
    }
    
}

#Preview {
    NavigationView{
        NoteView(currentNote: NoteRowRealm(value: ["id":"\(UUID().uuidString)","noteLabel": "label", "noteDescription": "Test preview"]))
    }
    
}
