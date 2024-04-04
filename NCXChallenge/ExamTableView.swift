//
//  ExamTableView.swift
//  NCXChallenge
//
//  Created by Maria Bruno on 04/04/24.
//

import UIKit

class ExamTableView: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload of the table view.
        tableView.reloadData()
    }
    
    // Called when the view has been added to a view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Displays an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! ViewController
        print(vc)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // Tell the data source to return the number of rows in a given section of a table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return exams.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamCell", for: indexPath) as! ExamCell
        
        // Fetch model object to display
        let exam = exams[indexPath.row]
        
        // Configure cell
        cell.update(with: exam)
        cell.showsReorderControl = true
        
        // Return cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Ask the data source to commit the insertion or deletion of a specified row in the receiver.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            exams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedExam = exams.remove(at: fromIndexPath.row)
        exams.insert(movedExam, at: to.row)
    }
    
    // Ask the delegate for the editing style of a row at a particular location in a table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    @IBSegueAction func showExamDetail(_ coder: NSCoder) -> ExamDetailVC? {
        let examToShow = exams[tableView.indexPathForSelectedRow?.row ?? 0]
                return ExamDetailVC(coder: coder, exam: examToShow)
    }
    
    @IBSegueAction func addSegueButton(_ coder: NSCoder) -> ExamDetailVC? {
        return ExamDetailVC(coder: coder, exam: nil)
    }
    
    
    @IBAction func unwindToExameTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? ExamDetailVC,
              let exam = sourceViewController.exam else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            exams[selectedIndexPath.row] = exam
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: exams.count, section: 0)
            exams.append(exam)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
       
    }
}

