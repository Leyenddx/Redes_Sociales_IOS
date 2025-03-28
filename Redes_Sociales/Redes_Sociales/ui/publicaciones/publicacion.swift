//
//  publicacion.swift
//  Redes_Sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

let publicacion_falsa = Publicacion(userId: 1, id: 1, title: "Lorem ipsu", body: "et dolor sit amet")

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    
    
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title ?? "Valor por defecto")")
        Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")
        
        NavigationLink{
            PerfilBasicoVista()
        } label: {
            Text("Ver pefil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){ comentario in
                    Text("Usuario: \(comentario.name)")
                    Text("\(comentario.body)")
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
