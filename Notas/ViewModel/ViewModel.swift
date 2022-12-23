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
    
}
