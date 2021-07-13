//
//  Note.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import Foundation
class TextNote: GenericNote, Codable {
    let body: String

    init(title: String, body: String, dateCreated: String, dateModified: String) {
        self.body = body
        super.init(title: title, dateCreated: dateCreated, dateModified: dateModified)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        body = try container.decode(String.self, forKey: .body)
        let title = try container.decode(String.self, forKey: .title)
        let dateCreated = try container.decode(String.self, forKey: .dateCreated)
        let dateModified = try container.decode(String.self, forKey: .dateModified)
        super.init(title: title, dateCreated: dateCreated, dateModified: dateModified)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(body, forKey: .body)
        try container.encode(title, forKey: .title)
        try container.encode(dateCreated, forKey: .dateCreated)
        try container.encode(dateModified, forKey: .dateModified)
        try container.encode(selected, forKey: .selected)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case dateCreated
        case dateModified
        case selected
        case body
    }
}

class AudioNote: GenericNote {
    let audioName: String

    init(title: String, audioName: String, dateCreated: String, dateModified: String) {
        self.audioName = audioName
        super.init(title: title, dateCreated: dateCreated, dateModified: dateModified)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case dateCreated
        case dateModified
        case selected
        case audioName
    }
}

class TextImageNote: GenericNote {
    let imageName: String
    let text: String

    init(imageName: String, text: String, title: String, dateCreated: String, dateModified: String) {
        self.imageName = imageName
        self.text = text
        super.init(title: title, dateCreated: dateCreated, dateModified: dateModified)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case dateCreated
        case dateModified
        case selected
        case imageName
        case text
    }
}

class GenericNote {
    let title: String
    let dateCreated: String
    let dateModified: String
    var selected: Bool {
        didSet {
            reloadSelected?()
        }
    }
    var reloadSelected: (() -> ())?

    init(title: String, dateCreated: String, dateModified: String) {
        self.title = title
        self.selected = false
        self.dateCreated = dateCreated
        self.dateModified = dateModified
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case dateCreated
        case dateModified
        case selected
    }

}
