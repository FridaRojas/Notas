//
//  AddNote.swift
//  Notas
//
//  Created by Frida Rojas Alarcon on 22/12/22.
//

import SwiftUI

struct AddNote: View {
    
    @ObservedObject var model : ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text("Agregar nota").font(.title).bold()
            Spacer()
            TextEditor(text: $model.nota).padding()
            Divider()
            DatePicker("Seleccione fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                model.save(context: context)
            }){
                Label(
                    title:{Text("Guardar").foregroundColor(Color.white).bold()},
                    icon: {Image(systemName: "dock.arrow.down.rectangle").foregroundColor(Color.white)}
                )
            }.padding()
                .background(Color.blue)
                .cornerRadius(8)
            
        }.padding()
    }
}


