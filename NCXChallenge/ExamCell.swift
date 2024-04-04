//
//  ExamCell.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 04/04/24.
//

import UIKit
class ExamCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code.
        // Shows the disclosure indicator in the row.
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state.
    }
    
    func update(with exam: Exam) {
        titleLabel.text = exam.name
    }
    
    
    
}

