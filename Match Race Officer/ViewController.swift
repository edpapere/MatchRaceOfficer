//
//  ViewController.swift
//  Match Race Officer
//
//  Created by Andrey Pereslavtsev on 06.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = indexPath.row.isMultiple(of: 2) ? .green : .cyan
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var splash: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
    var countButtonPress = 0 {
        didSet {
            updateButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Функция: \(#function)"
        label.textColor = .blue
        
        splash.image = UIImage(named: "splash")
        
        if let text = textView.text {
            textView.text = String(text.reversed())
        }
        
        // UIScrollView
        let imageView = UIImageView(image: UIImage(named: "splash"))
        let scrollView = UIScrollView(frame: CGRect(x: view.bounds.midX - 200, y: 100, width: 400, height: 200) )
        scrollView.backgroundColor = .blue
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        view.sendSubviewToBack(scrollView)
        
        tableView.backgroundColor = .cyan
        tableView.dataSource = self
        
        updateButton()
        
    }
    
    fileprivate func updateButton() {
        button.setTitle("Count: \(countButtonPress)", for: [])
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        countButtonPress += 1
     //   updateButton()
     //   print(#line,#function,"Button pressed")
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        print(#line,#function,"Segmented control pressed: \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            countButtonPress = 0
        case 1:
            countButtonPress -= 1
        case 2:
            countButtonPress += 1
        default:
            fatalError("Unknown index of Segmented control: \(sender.selectedSegmentIndex) at \(#line) \(#function)")
        }
    }
    
    @IBAction func dataEntered(_ sender: UITextField) {
        print(#line, #function, sender.tag, sender.text ?? "nil")
    }
    

    @IBAction func sliverValueChanged(_ sender: UISlider) {
        sender.value = Float( 25 * Int(sender.value / 25) )
        print(#line,#function,sender.value)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        print(#line,#function, sender.isOn)
        view.backgroundColor = sender.isOn ? .white : .cyan
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        print(#line,#function, sender.date)
    }
    
}

