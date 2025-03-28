//
//  publicaciones_general.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct PublicacionesGeneral: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
         ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    NavigationLink{
                        PublicacionVista()
                    } label : {
                        HStack{
                            Text("\(publicacion.id)")
                            VStack{
                                Text("\(publicacion.title)")
                                Text("\(publicacion.body)")
                            }
                        }
                    }.simultaneousGesture(TapGesture().onEnded({
                        controlador.seleccionar_publicacion(publicacion)
                    }))
                }
            }
        }
     }
   }
}

#Preview {
    PublicacionesGeneral()
        .environment(ControladorAplicacion())
}
