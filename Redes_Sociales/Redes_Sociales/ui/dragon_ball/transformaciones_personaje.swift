//
//  transformaciones_personaje.swift
//  Redes_Sociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI

struct TransformacionesPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    //colores
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
    let backgroundImage = Image("FondoDragon")
    
    var body: some View {
        ScrollView{
            VStack{
                Text("\(controlador.personaje?.name ?? "Nombre por defecto")")
                    .font(.title)
                ForEach(controlador.personaje?.transformations ?? []) { Transformaciones in
                    Text("NOMBRE: \(Transformaciones.name)")
                    Text("KI: \(Transformaciones.ki)")
                    AsyncImage(url: URL(string: "\(Transformaciones.image)"), scale: 4){image in
                        image.image?.resizable().frame(width: 250, height: 500)
                    }
                }
            }
            .padding()
        }
        .background(backgroundImage)
    }
}

#Preview {
    TransformacionesPersonaje()
        .environment(ControladorAplicacion())
}
