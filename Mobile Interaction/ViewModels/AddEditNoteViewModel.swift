//
//  AddEditNoteViewModel.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import Foundation
class AddEditNoteViewModel {
    let note: GenericNote?
    var repository: RepositoryProtocol
    init(note: TextNote?, repository: RepositoryProtocol) {
        self.note = note
        self.repository = Repository()
    }
    
    var title: String {
        return note?.title ?? "Add New Note"
    }
    convenience init(note: TextNote?) {
        self.init(note: note, repository: Repository())
    }
    
    
    func saveNote(note: TextNote){
        repository.saveNote(textNote: note)
    }
}
