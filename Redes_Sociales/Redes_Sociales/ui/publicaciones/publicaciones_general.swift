//
//  publicaciones_general.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct PublicacionesGeneral: View {
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    Text("\(publicacion.id)")
                    VStack{
                        Text("\(publicacion.title)")
                        Text("\(publicacion.body)")
                    }
                }
            }
        }
        .onAppear{
            if controlador.publicaciones.isEmpty{
                Task{
                    await controlador.obtener_publicaciones()
                }
            }
        }
    }
} 

#Preview {
    PublicacionesGeneral()
}
