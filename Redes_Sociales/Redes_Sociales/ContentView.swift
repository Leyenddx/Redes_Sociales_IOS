//
//  ContentView.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI
//Para usar la galeria
import PhotosUI



struct ContentView: View {
    @State var foto_seleccionada:
    PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    var body: some View {
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
        PublicacionesGeneral()
        }
    }

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
