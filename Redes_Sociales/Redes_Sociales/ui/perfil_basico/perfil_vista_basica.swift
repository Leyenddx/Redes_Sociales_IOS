//
//  perfil_vista_basica.swift
//  Redes_Sociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI
//Para usar la galeria
import PhotosUI

struct PerfilBasicoVista: View {
    
    @State var foto_seleccionada:
    PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    let acent = Color(red: 0.67041, green: 0.78467, blue: 0.97889)
    let onAccent = Color(red: 0.06025, green: 0.16915, blue: 0.36485)
    let accentContainer = Color(red: 0.10561, green: 0.25683, blue: 0.52989)
    let onAcentContainer = Color(red: 0.83587, green: 0.89299, blue: 0.98864)
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $foto_seleccionada){
                Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatar2))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .clipShape(.circle)
            }
            .onChange(of: foto_seleccionada) {valor_anterior, valor_nuevo in
                Task{
                    if let foto_seleccionada, let datos = try? await foto_seleccionada.loadTransferable(type: Data.self){
                        if let image = UIImage(data: datos){
                            foto_a_mostrar = image
                        }
                    }
                }
            }
            VStack{
                Text("Usuario: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
                Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito")")
                Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "ver esto")")
                    .onDisappear(){
                        print("Adios mundo cruel, este mensaje se ve cuando destruimos la vista")
                    }
                  }
                }
    
    .background(acent)
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
