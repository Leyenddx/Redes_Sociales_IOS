//
//  personaje_vista.swift
//  Redes_Sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PersonajeVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    //colores
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
    let backgroundImage = Image("FondoDragon")
    
    var body: some View {
        
       
        AsyncImage(url: URL(string: "\(controlador.personaje_seleccionado?.image ?? "Imagen por defecto")"), scale: 4){image in
        image.image?.resizable().frame(width: 170, height: 340)
    
            ScrollView{
                VStack{
                    Text("\(controlador.personaje_seleccionado?.name ?? "Nombre por dfecto")")
                        .font(.title)
                    Text("GENERO: \(controlador.personaje_seleccionado?.gender ?? "Genero por dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("AFILIACION: \(controlador.personaje_seleccionado?.affiliation ?? "Afiliacion por dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("RAZA: \(controlador.personaje_seleccionado?.race ?? "raza por dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("KI: \(controlador.personaje_seleccionado?.ki ?? "Ki por dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("MAX KI: \(controlador.personaje_seleccionado?.maxKi ?? "maxKi por dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("PlANETA DE ORIGEN: \(controlador.personaje?.originPlanet?.name ?? "Planeta dfecto")")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    Text("NUMERO DE TRANSFORMACIONES: \(controlador.personaje?.transformations?.count ?? 0)")
                        .foregroundColor(onAccent)
                        .font(.title3)
                    VStack{
                        Text("DESCRIPCION: \(controlador.personaje_seleccionado?.description ?? "Descripcion por dfecto")")
                            .foregroundColor(onAcentContainer)
                            .padding()
                    }
                    .background(Color(.orange))
                    .padding()
                }
                .padding()
            }
            .background(acent)
        }
        
        .background(backgroundImage)
    }
    
        
}

#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
