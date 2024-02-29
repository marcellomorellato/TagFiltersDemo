//
//  ViewController.swift
//  TagFiltersDemo
//
//  Created by Marcello Morellato on 29/02/24.
//

import UIKit
import SwiftUI
import Combine

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {
    @IBOutlet var tagFilterContainerView: UIView!
    @IBOutlet var label: UILabel!
    
    // Create an instance of TagFilterViewModel
    let viewModel = TagFilterViewModel()
    
    // Create a cancellable to hold the subscription
    var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTagFilterView()
        
        // Observe changes to the selectedTags set and update the label
        cancellable = viewModel.$selectedTags
            .sink { [weak self] selectedTags in
                // Update the label with the selected tags
                self?.label.text = "Selected Tags: \(selectedTags.joined(separator: ", "))"
            }
    }

    func setupTagFilterView() {
        let swiftUIView = TagFilterView(viewModel: self.viewModel)
        
        let hostingController = UIHostingController(rootView: swiftUIView)

        addChild(hostingController)
        tagFilterContainerView.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        // Setup constraints
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: tagFilterContainerView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: tagFilterContainerView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: tagFilterContainerView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: tagFilterContainerView.bottomAnchor)
        ])
    }
}
