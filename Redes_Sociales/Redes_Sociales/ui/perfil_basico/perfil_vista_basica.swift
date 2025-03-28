//
//  perfil_vista_basica.swift
//  Redes_Sociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("Usuario: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "ver esto")")
            .onDisappear(){
                print("Adios mundo cruel, este mensaje se ve cuando destruimos la vista")
            }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
