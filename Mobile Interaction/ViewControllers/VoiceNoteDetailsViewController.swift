//
//  VoiceNoteDetailsViewController.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit

class VoiceNoteDetailsViewController: UIViewController {
    @IBOutlet weak var audioName: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var dateUpdated: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    var coordinator: Coordinator?
    var viewModel: VoiceNoteDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = viewModel?.note.title
        audioName.text = viewModel?.note.audioName
        dateCreated.text = viewModel?.note.dateCreated
        dateUpdated.text = viewModel?.note.dateModified
    }
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.backPressed()
    }
    @IBAction func toEditPressed(_ sender: Any) {
        //go to edit note
    }

}
