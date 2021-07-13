//
//  Repository.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import Foundation
protocol RepositoryProtocol {
    func saveNote(textNote: TextNote)
    func getNotes() -> [TextNote]
}
class Repository: RepositoryProtocol {
    private let key = "notes"
    //Usually its saved on the CoreData/Realm/SQLite but to not spend time im using UserDefaults
    func saveNote(textNote: TextNote) {
        var array = [TextNote]()
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                array = try JSONDecoder().decode([TextNote].self, from: data)
            } catch {
                
            }
        }
        array.append(textNote)
        if let data = try? JSONEncoder().encode(array) {
            UserDefaults.standard.setValue(data, forKey: key)
        }
        
    }
    
    func getNotes() -> [TextNote] {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let arr = try JSONDecoder().decode([TextNote].self, from: data)
                return arr
            } catch {
                
            }
        }
        return [TextNote]()
    }
}
