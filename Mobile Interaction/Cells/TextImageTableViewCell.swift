//
//  TextImageTableViewCell.swift
//  Mobile Interaction
//
//  Created by Agon Mati on 12.7.21.
//

import UIKit

class TextImageTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var dateModified: UILabel!

    var delegate: CellStyleChanged?

    var viewModel: TextImageNote? {
        didSet {
            self.title.text = self.viewModel?.title
            self.dateModified.text = self.viewModel?.dateModified
            self.dateCreated.text = self.viewModel?.dateCreated
            self.styleChanged(selected: self.viewModel?.selected ?? false)
            self.viewModel?.reloadSelected = {
                self.styleChanged(selected: self.viewModel?.selected ?? false)
            }
        }
    }

    func styleChanged(selected: Bool) {
        if selected {
            dateCreated.isHidden = false
            dateModified.isHidden = false
        } else {
            dateCreated.isHidden = true
            dateModified.isHidden = true
        }
    }

    @IBAction func changeStylePressed(_ sender: Any) {
        viewModel?.selected.toggle()
        delegate?.styleChanged()
    }
}
