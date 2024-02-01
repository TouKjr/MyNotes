//
//  MainScreenView.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @EnvironmentObject private var vm: MainScreenViewModel
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(vm.notesRowsRealmGroup.notesRowsRealm){ note in
                    NavigationLink {
                        
                        NoteView(currentNote: note)
                
                    } label: {
                        NoteRowView(currentNote: note)
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
            .toolbar {
                Button(action: {
                    alertTF(title: "New note's label",
                            message: nil,
                            hintText: "Note's label",
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
            }
        }
        
    }
}

#Preview {
    MainScreenView()
        .environmentObject(MainScreenViewModel())
}
