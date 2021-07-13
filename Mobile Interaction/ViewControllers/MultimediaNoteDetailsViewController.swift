//
//  MultimediaNoteDetailsViewController.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit

class MultimediaNoteDetailsViewController: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var dateUpdated: UILabel!
    var coordinator: Coordinator?
    var viewModel: MultimediaNoteDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = viewModel?.note.title
        imageName.text = viewModel?.note.imageName
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
