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
                        Text("hola mundo")
                    } label : {
                        HStack{
                            Text("\(publicacion.id)")
                            VStack{
                                Text("\(publicacion.title)")
                                Text("\(publicacion.body)")
                            }
                        }.onTapGesture {
                            //controlador.mostrar_publicacion(publicacion.id)
                            print("usted selecciono \(publicacion.id)")
                        }
                    }
                }
            }
        }
//        .onAppear{
//            print("Hola mundo")
//        }
     }
   }
}

#Preview {
    PublicacionesGeneral()
        .environment(ControladorAplicacion())
}
