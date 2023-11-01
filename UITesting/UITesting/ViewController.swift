//
//  ViewController.swift
//  UITesting
//
//  Created by Hanh Vo on 3/7/23.
//

import UIKit

final class ViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let username: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        return field
    }()

    private let password: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        return field
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(button)
        addConstraints()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),

            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            username.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            username.widthAnchor.constraint(equalToConstant: 320),
            username.heightAnchor.constraint(equalToConstant: 50),

            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            password.widthAnchor.constraint(equalToConstant: 320),
            password.heightAnchor.constraint(equalToConstant: 50),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func didTapButton() {
        guard let username = username.text, let password = password.text, username == "hanh", password == "password" else {

            let alert = UIAlertController(title: "Invalid Login", message: "Your login credentials were incorrect. Try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)

            return
        }

        let vc = AccountVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

/// Account view controller
final class AccountVC: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome, Hanh!"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

