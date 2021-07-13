//
//  AddEditNoteViewController.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit
protocol AddEditNoteViewControllerProtocol {
    func noteAdded()
}
class AddEditNoteViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    var coordinator: Coordinator?
    
    @IBOutlet weak var titleTxf: UITextField!
    @IBOutlet weak var bodyTcf: UITextField!
    @IBOutlet weak var dateCreated: UITextField!
    @IBOutlet weak var dateUpdated: UITextField!
    
    var viewModel: AddEditNoteViewModel?
    var delegate: AddEditNoteViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = viewModel?.title
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let textNote = TextNote(title: titleTxf.text ?? "", body: bodyTcf.text ?? "", dateCreated: dateCreated.text ?? "", dateModified: dateUpdated.text ?? "")
        viewModel?.saveNote(note: textNote)
        delegate?.noteAdded()
        coordinator?.backPressed()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.backPressed()
    }
    
}
