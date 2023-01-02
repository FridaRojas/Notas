//
//  ViewModel.swift
//  Notas
//
//  Created by Frida Rojas Alarcon on 22/12/22.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject{
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var update : Notas!
    
    func save(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do{
            try context.save()
            //alerta a usuario
            print("guardado")
            show.toggle()
            nota = ""
        }catch let error as NSError{
            //alerta a usuario
            print("no guardo", error.localizedDescription)
        }
        
    }
    
    func delete (item: Notas, context: NSManagedObjectContext){
        context.delete(item)
        
        do{
            try context.save()
            //alerta a usuario
            print("Eliminado")
        }catch let error as NSError{
            //alerta a usuario
            print("no eliminado", error.localizedDescription)
        }
    }
    
    func sendData(item: Notas){
        update = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        update.fecha = fecha
        update.nota = nota
        
        do{
            try context.save()
            //alerta a usuario
            print("Editado")
            show.toggle()
            nota = ""
            update = nil
        }catch let error as NSError{
            //alerta a usuario
            print("no editado", error.localizedDescription)
        }
        
    }
    
}
