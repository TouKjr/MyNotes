//
//  MainScreenView.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import SwiftUI

struct MainScreenView: View {
    @State var NotesList = [NoteRowView]()
    var body: some View {
        NavigationView{
            
            List{
                ForEach(NotesList){ note in
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
                    
                    print(indexSet)
                    print(indexSet.first!)
                    
                    NotesList.remove(atOffsets: indexSet)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets.init(top: 8, leading: 16, bottom: 8, trailing: 0))
            }
            .navigationTitle(Text("MyNotes"))
            .navigationBarBackButtonHidden()
            .listStyle(.plain)
            .toolbar(content: {
                Button(action: {
                    NotesList.append(NoteRowView(noteLabel: "UITest", noteDescription: "Swipe left to delete"))
                }, label: {
                    Image(systemName: "plus.circle")
                })
            })
        }
        
    }
}

#Preview {
    MainScreenView()
}
