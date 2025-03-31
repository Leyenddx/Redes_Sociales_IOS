//
//  publicaciones_general.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct PublicacionesGeneral: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    //colores
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    
    var body: some View {
        NavigationStack{
         ScrollView{
            VStack{
                Text("Publicaciones Generales")
                    .foregroundColor(onAccent)
                ForEach(controlador.publicaciones){ publicacion in
                    NavigationLink{
                        PublicacionVista()
                    } label : {
                            VStack{
                                Divider()
                                Text("Publicacion \(publicacion.id)").foregroundColor(onAccent)
                               
                                VStack{
                                    Text("Tema: \(publicacion.title)")
                                        .foregroundColor(onAccent)
                                    Text("\(publicacion.body)")
                                        .foregroundColor(onAccent)
                                }
                            }
                            .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }.simultaneousGesture(TapGesture().onEnded({
                        controlador.seleccionar_publicacion(publicacion)
                    }))
                }
            }
        }
         .background(acent)
     }
   }
}

#Preview {
    PublicacionesGeneral()
        .environment(ControladorAplicacion())
}
