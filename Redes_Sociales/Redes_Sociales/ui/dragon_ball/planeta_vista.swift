//
//  planeta_vista.swift
//  Redes_Sociales
//
//  Created by alumno on 4/28/25.
//

import SwiftUI

struct PlanetaVista: View {
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
                Text("\(controlador.personaje?.originPlanet?.name ?? "Nombre por defecto")")
                    .font(.title)
                Text("Destruido: \(controlador.personaje?.originPlanet?.isDestroyed ?? true)")
                    .foregroundColor(onAccent)
                    .font(.title3)
                Text("Descripcion: \(controlador.personaje?.originPlanet?.description ?? "descripcion por defecto")")
                    .foregroundColor(onAccent)
                    .font(.title3)
                AsyncImage(url: URL(string: "\(controlador.personaje?.originPlanet?.image ?? "Imagen por defecto")"), scale: 4){image in
                    image.image?.resizable().frame(width: 250, height: 160)
                }
            }
            .padding()
        }
        .background(backgroundImage)
    }
}

#Preview {
    PlanetaVista()
        .environment(ControladorAplicacion())
}
