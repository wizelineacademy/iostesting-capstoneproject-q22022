//
//  FeedViewController.swift
//  MiniBootcamp
//
//  Created by Marco Alonso Rodriguez on 11/05/23.
//

import UIKit

enum FetchState {
    case loading
    case failure
    case success
}

final class FeedViewController: UIViewController {
    
    private(set) lazy var tableView: UITableView = {
           let tableView =  UITableView()

            tableView.delegate = self
            tableView.dataSource = self

            return tableView
        }()
    
    private(set) lazy var loader: UIActivityIndicatorView = {
            UIActivityIndicatorView(frame: view.bounds)
        }()
    
    var viewModel: FeedViewModel = FeedViewModel()
    
    override func viewDidLoad() {
        
        title = viewModel.title
        view.backgroundColor = viewModel.backgroundColor
        setupTableView()
        binding()
    }
    
    private func binding() {
        viewModel.observer.bind { [unowned self] state in
            switch state {
            case .loading:
                self.view.addSubview(loader)
            case .success:
                self.loader.removeFromSuperview()
            case .failure:
                self.loader.removeFromSuperview()
            default:
                break
            }
        }
    }
    
  
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier) as? TweetCell else { return UITableViewCell() }
        
        return cell
    }
    
}

