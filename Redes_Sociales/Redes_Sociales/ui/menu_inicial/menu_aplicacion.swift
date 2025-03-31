//
//  menu_aplicacion.swift
//  Redes_Sociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            PublicacionesGeneral()
                .tabItem {Label( "Publicaciones", systemImage: "signpost.and.arrowtriangle.up.fill" )}
                .badge(controlador.publicaciones.count)
            Text("Hela desde pantalla 2")
                .tabItem { Label( "Pantalla 2", systemImage: "square.and.arrow.up.fill" )}
            Text("Hela desde pantalla 3")
                .tabItem { Label( "Perfil", systemImage: "person.fill" )}
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
