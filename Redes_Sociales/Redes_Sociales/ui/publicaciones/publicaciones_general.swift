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
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
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
                                Text("Publicacion \(publicacion.id)").foregroundColor(onAcentContainer)
                               
                                VStack{
                                    Text("Tema: \(publicacion.title)")
                                        .foregroundColor(onAcentContainer)
                                    Text("\(publicacion.body)")
                                        .foregroundColor(onAcentContainer)
                                }
                                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                                
                            }
                            .background(Color(accentContainer))
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
