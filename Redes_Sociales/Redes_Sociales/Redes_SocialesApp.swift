//
//  Redes_SocialesApp.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

@main
@MainActor
struct Redes_SocialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
