//
//  QuestionTableViewCell.swift
//  UIKITTableView
//
//  Created by Hanh Vo on 3/9/23.
//

import Foundation
import UIKit

class QuestionTableViewCell: UITableViewCell{
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    var isExpanded = false {
        didSet {
            answerTextView.isHidden = !isExpanded
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        answerTextView.isEditable = false
        answerTextView.isSelectable = false
        answerTextView.isHidden = true
    }
    
    func configure(with question: QAEntity) {
        questionLabel.text = question.question
        answerTextView.text = question.answer
        //answerTextView.isHidden = !question.isExpanded
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isExpanded = false
        answerTextView.isHidden = !isExpanded
        answerTextView.text = ""
    }
}

