//
//  controlador_app.swift
//  Redes_Sociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var personaje_seleccionado: MonoChino? = nil
    var personaje: MonoChino? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    //Seccion dragon ball
    var pagina_resultados: PaginaResultado? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            await self.descargar_monos_chinos()
            
        }
    }
    
    func descargar_monos_chinos() async {
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else {return}
        
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_info_personaje(id:Int) async{
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = mono_chino
    }
    
    func decargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits de mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else {return}
        
        publicaciones = publicaciones_descargadas
        
    }
    
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits de mi funcion \(#function)")
        }
        
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else {return}
        
        comentarios = comentarios_descargados
    }
    
    func seleccionar_publicacion(_ publicacion:Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
    }
    
    func seleccionar_mono_chino(_ mono:MonoChino) -> Void {
        personaje_seleccionado = mono
        
        Task.detached(operation: {
            await self.descargar_monos_chinos()
        })
    }
    
    func descargar_perfil(id: Int) async -> Void {
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_pefil(id: id) else { return }
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id: id)
        }
    }
    
}
