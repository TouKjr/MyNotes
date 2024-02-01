//
//  MainScreenView.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import SwiftUI

struct MainScreenView: View {
    @State var NotesList = [NoteRowView]()
    @EnvironmentObject private var vm: MainScreenViewModel
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(vm.notesRowsRealmGroup.notesRowsRealm){ note in
                    NavigationLink {
                        //Окно самой задачи
                        VStack{
                        }
                        .navigationTitle(note.noteLabel)
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        NoteRowView(noteLabel: note.noteLabel, noteDescription: note.noteDescription)
                    }
                    .foregroundStyle(.black)
                    
                }
                .onDelete { indexSet in
                    
                    vm.deleteNote(vm.notesRowsRealmGroup.notesRowsRealm[indexSet.first!])
                    
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets.init(top: 8, leading: 16, bottom: 8, trailing: 0))
            }
            .navigationTitle(Text("MyNotes"))
            .navigationBarBackButtonHidden()
            .listStyle(.plain)
            .toolbar(content: {
                Button(action: {
                    alertTF(title: "Add new note",
                            message: nil,
                            hintText: "Note's name",
                            primaryTitle: "Add",
                            secondaryTitle: "Cancel",
                            primaryAction: { text in
                        vm.addNote(noteText: text)
                    },
                            secondaryAction: {})
                },
                       label: {
                    Image(systemName: "plus.circle")
                })
            })
        }
        
    }
}

#Preview {
    MainScreenView()
        .environmentObject(MainScreenViewModel())
}
