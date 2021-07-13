//
//  Coordinator.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit
protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func backPressed()
}
extension Coordinator {
        
    func backPressed() {
        self.navigationController.popViewController(animated: true)
    }
}

protocol MainCoordinatorProtocol: Coordinator {

}
class MainCoordinator: MainCoordinatorProtocol {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        let vc = NotesViewController.instatiate(storyboard: UIStoryboard(name: "Main", bundle: nil))
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toAddOrEditNote(note: TextNote?, delegate: AddEditNoteViewControllerProtocol?){
        let vc = AddEditNoteViewController.instatiate(storyboard: UIStoryboard(name: "Main", bundle: nil))
        vc.viewModel = AddEditNoteViewModel(note: note)
        vc.coordinator = self
        vc.delegate = delegate
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toTextNoteDetails(note: TextNote) {
        let vc = TextNoteDetailsViewController.instatiate(storyboard: UIStoryboard(name: "Main", bundle: nil))
        vc.viewModel = TextNoteDetailsViewModel(note: note)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toAudioNoteDetails(note: AudioNote) {
        let vc = VoiceNoteDetailsViewController.instatiate(storyboard: UIStoryboard(name: "Main", bundle: nil))
        vc.viewModel = VoiceNoteDetailsViewModel(note: note)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toMultimediaNoteDetails(note: TextImageNote) {
        let vc = MultimediaNoteDetailsViewController.instatiate(storyboard: UIStoryboard(name: "Main", bundle: nil))
        vc.viewModel = MultimediaNoteDetailsViewModel(note: note)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
protocol Storyboarded {
    static func instatiate(storyboard: UIStoryboard) -> Self
}
extension Storyboarded where Self:UIViewController {
    static func instatiate(storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: Self.IDENTIFIER) as! Self
    }
}
extension UIViewController:Storyboarded {
    
}
extension NSObject {
    static var IDENTIFIER:String {
        return String(describing: self.self)
    }
}
