//
//  ContentView.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       PublicacionesGeneral()
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
