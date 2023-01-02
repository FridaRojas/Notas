//
//  Home.swift
//  Notas
//
//  Created by Frida Rojas Alarcon on 22/12/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    @Environment(\.managedObjectContext) var context
    //Obtiene los resultados de la entidad Notas ordenados por fecha ascendente y los guarda en results
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)],animation: .spring()) var results : FetchedResults<Notas>
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(results){ item in
                    VStack(alignment: .leading){
                        Text(item.nota ?? "Sin nota")
                            .font(.title)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date)
                    }.contextMenu(ContextMenu(menuItems: {
                        // ELIMINA
                        Button(action:{
                            model.delete(item: item, context: context)
                        }){
                            Label(title: {Text("Eliminar")}, icon: {Image(systemName: "trash")})
                        }
                        //EDITA
                        Button(action:{
                            model.sendData(item: item)
                        }){
                            Label(title: {Text("Editar")}, icon: {Image(systemName: "pencil")})
                        }
                    }))
                }
            }.navigationBarTitle("Notas")
                .navigationBarItems(trailing:
                                        Button(action:{
                                            model.show.toggle()
                                        }){
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(.blue)
                                        }
                ).sheet(isPresented: $model.show, content: {AddNote(model: model)})
        }
        
    }
}

