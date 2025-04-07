//
//  pantalla_personajes.swift
//  Redes_Sociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    //colores
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
    let backgroundImage = Image("FondoDragon")
    
    var body: some View {
        NavigationStack{
            if(controlador.pagina_resultados != nil){
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                                PersonajeVista()
                            } label : {
                                VStack{
                                    Text("\(personaje.name)")
                                        .foregroundColor(Color(onAcentContainer))
                                        .font(.title)
                                    AsyncImage(url: URL(string: "\(personaje.image)"), scale: 4)
                                }
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador.seleccionar_mono_chino(personaje)
                            }))
                        }
                        .frame(width: 300)
                        .background(Color.orange)
                        .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }
                }.background(backgroundImage)
            }
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
