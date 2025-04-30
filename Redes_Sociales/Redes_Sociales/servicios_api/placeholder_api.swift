//
//  placeholder_api.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI: Codable{
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones() async -> [Publicacion]?{
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(post_id: Int) async -> [Comentario]? {
        let ubicacion_recurso = "/posts/\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_pefil(id:Int) async -> Perfil?{
        let ubicacion_recurso = "/users/\(id)/"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do{
            guard let url = URL(string: "\(url_de_servicio)\(recurso)") else { throw ErroresDeRed.malaDireccionUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
        }
        catch ErroresDeRed.malaDireccionUrl{
            print("Tienes mal la URL, cambiala")
        }
        catch ErroresDeRed.badResponse{
            print("Algo salio mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus{
            print("¿Como consigues un status negativo de algo que nisiquiera se mueve?")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Tienes mal el modelo o la implementacion de este")
        }
        catch ErroresDeRed.invalidRequest{
            print("¿Como llegaste aqui?")
        }
        catch {
            print("Lo que sea...")
        }
        
        return nil
    }
}
