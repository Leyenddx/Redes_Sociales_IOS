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
    
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
    var body: some View {
        
        Image(uiImage: controlador.imagen_de_perfil ?? UIImage(resource: .avatar2))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .clipShape(.circle)
        
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
            .foregroundColor(onAcentContainer)
            .padding(30)
            .background(accentContainer)
        }
    }
}

#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
