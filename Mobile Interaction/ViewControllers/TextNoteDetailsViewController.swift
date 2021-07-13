//
//  TextNoteDetailsViewController.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit

class TextNoteDetailsViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    var coordinator: MainCoordinator?
    var viewModel: TextNoteDetailsViewModel?
    
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var dateModified: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = viewModel?.note.title
        body.text = viewModel?.note.body
        dateCreated.text = viewModel?.note.dateCreated
        dateModified.text = viewModel?.note.dateModified
    }
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.backPressed()
    }
    
    @IBAction func editPressed(_ sender: Any) {
        coordinator?.toAddOrEditNote(note: viewModel?.note, delegate: nil)
    }
}
