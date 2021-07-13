//
//  NotesViewController.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit

class NotesViewController: UIViewController {

    var coordinator: MainCoordinator?
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initViewModel()
    }
    
    func initViewModel(){
        viewModel.reload = {
            //WE are doing it on the main thread because in the future the delegate can be called from a bacground thread and we dont want to execute UI task on bacground thread(example http network request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.getData()
    }

    
    func initTableView(){
        let text = UINib(nibName: TextNoteTableViewCell.IDENTIFIER, bundle: nil)
        let audio = UINib(nibName: AudioNoteTableViewCell.IDENTIFIER, bundle: nil)
        let image = UINib(nibName: TextImageTableViewCell.IDENTIFIER, bundle: nil)
        tableView.register(text, forCellReuseIdentifier: TextNoteTableViewCell.IDENTIFIER)
        tableView.register(audio, forCellReuseIdentifier: AudioNoteTableViewCell.IDENTIFIER)
        tableView.register(image, forCellReuseIdentifier: TextImageTableViewCell.IDENTIFIER)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addNotePressed(_ sender: Any) {
        coordinator?.toAddOrEditNote(note: nil, delegate: self)
    }
}
extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellVM = viewModel.getCell(for: indexPath.row) as? TextNote {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextNoteTableViewCell.IDENTIFIER) as! TextNoteTableViewCell
            cell.viewModel = cellVM
            cell.delegate = self
            return cell
        } else if let cellVM = viewModel.getCell(for: indexPath.row) as? AudioNote {
            let cell = tableView.dequeueReusableCell(withIdentifier: AudioNoteTableViewCell.IDENTIFIER) as! AudioNoteTableViewCell
            cell.viewModel = cellVM
            cell.delegate = self
            return cell

        } else if let cellVM = viewModel.getCell(for: indexPath.row) as? TextImageNote {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextImageTableViewCell.IDENTIFIER) as! TextImageTableViewCell
            cell.viewModel = cellVM
            cell.delegate = self
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellVM = viewModel.getCell(for: indexPath.row) as? TextNote {
            coordinator?.toTextNoteDetails(note: cellVM)
        } else if let cellVM = viewModel.getCell(for: indexPath.row) as? AudioNote {
            coordinator?.toAudioNoteDetails(note: cellVM)
        } else if let cellVM = viewModel.getCell(for: indexPath.row) as? TextImageNote {
            coordinator?.toMultimediaNoteDetails(note: cellVM)
        }
    }
}

extension NotesViewController: CellStyleChanged {
    func styleChanged() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
extension NotesViewController: AddEditNoteViewControllerProtocol {
    func noteAdded() {
        viewModel.getData()
    }
}
