//
//  EmployeeInfoCellTableViewCell.swift
//  JLLExample
//
//  Created by Mike Jasso on 01/08/24.
//

import UIKit

class EmployeeInfoCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellWith(employee: Employee) {
        nameLabel.text = employee.employeeName
        ageLabel.text = "\(employee.employeeAge)"
    }
    
}
