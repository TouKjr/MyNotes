//
//  NoteRowView.swift
//  MyNotes
//
//  Created by TouKir on 01/02/2024.
//

import SwiftUI
import RealmSwift

struct NoteRowView: View, Identifiable  {
    
    @ObservedRealmObject var currentNote: NoteRowRealm
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var id: String {UUID().uuidString}
    
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
            
            VStack(alignment: .leading){
                
                HStack{
                    Text(currentNote.noteLabel)
                        .font(.custom(RobotoFontConstants.RobotoMedium, size: 15, relativeTo: .title3))
                    Spacer()
                }
                
                HStack{
                    Text(currentNote.noteDescription)
                        .font(.custom(RobotoFontConstants.RobotoRegular, size: 12, relativeTo: .body))
                }
                
                
            }
            .padding(.top, 8)
            .padding(.bottom, 8)
            .multilineTextAlignment(.leading)
            .frame(width: width * 0.85, height: height * 0.1)
            
        }
        .frame(width: width * 0.915, height: height * 0.1)
        .shadow(radius: 6)
        .padding(.horizontal, 16)
        
    }
}




//#Preview {
//   Text("text")
//}
