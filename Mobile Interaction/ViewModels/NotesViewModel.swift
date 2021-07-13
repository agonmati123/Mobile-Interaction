//
//  NotesViewModel.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import Foundation
class NotesViewModel {
    var cells: [GenericNote] = [GenericNote]()
    var numberOfRows: Int {
        return cells.count
    }

    var reload: (() -> ())?

    let repository: RepositoryProtocol
    
    convenience init() {
        self.init(repository: Repository())
    }
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func getData() {
        cells = repository.getNotes()
        if cells.isEmpty {
            let text = TextNote(title: "Text Note", body:  "This is a text note", dateCreated:  "2020", dateModified: "2021")
            let audio = AudioNote(title: "Text Note", audioName:  "Audio not file name", dateCreated:  "2020", dateModified: "2021")
            let image = TextImageNote(imageName: "Test Image", text: " This is a image text note", title:  "Text Note", dateCreated:  "2020", dateModified: "2021")

            cells.append(text)
            cells.append(audio)
            cells.append(image)
        }
        reload?()
    }

    func getCell(for row: Int) -> GenericNote {
        return cells[row]
    }
}
