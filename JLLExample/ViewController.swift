//
//  ViewController.swift
//  JLLExample
//
//  Created by Mike Jasso on 29/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var apiManager = APIManager()
    
    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        tableView.register(UINib(nibName: "EmployeeInfoCellTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeInfoCellTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Task {
            do {
                let response: APIEmployeeResponse = try await apiManager.getData(from: .employee)
                employees = response.data
                tableView.reloadData()
            } catch {
                print("Error")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: EmployeeInfoCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeInfoCellTableViewCell", for: indexPath) as? EmployeeInfoCellTableViewCell else {
            return UITableViewCell()
        }
        let employee = employees[indexPath.row]
        cell.configCellWith(employee: employee)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}


