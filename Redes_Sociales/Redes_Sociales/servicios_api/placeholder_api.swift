//
//  placeholder_api.swift
//  Redes_Sociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI: Codable{
    func descargar_publicaciones(desde: String) async throws -> [Publicacion]?{
        do{
            guard let url = URL(string: desde) else { throw ErroresDeRed.malaDireccionUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
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
        
        return nil
    }
}
