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
}
