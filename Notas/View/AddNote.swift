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
            Text(model.update != nil ? "Editar nota" : "Agregar Nota").font(.title).bold()
            Spacer()
            TextEditor(text: $model.nota).padding()
            Divider()
            DatePicker("Seleccione fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                if model.update != nil{
                    model.editData(context: context)
                }else{
                    model.save(context: context)
                }
                
            }){
                Text("Guardar").foregroundColor(.white).bold()
            }.padding()
                .background(model.nota == "" ? Color.gray : Color.blue)
                .cornerRadius(8)
                .disabled(model.nota == "" ? true : false)
            
        }.padding()
    }
}


