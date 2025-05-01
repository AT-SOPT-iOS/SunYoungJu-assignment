//
//  MainViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//
import UIKit
import SwiftUI

class MainViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        let bannerVC = BannerViewController()
        addChild(bannerVC)
        contentView.addSubview(bannerVC.view)
        bannerVC.didMove(toParent: self)

        bannerVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerVC.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            bannerVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerVC.view.heightAnchor.constraint(equalToConstant: 400)
        ])

        let topVC = TopViewController()
        addChild(topVC)
        contentView.addSubview(topVC.view)
        topVC.didMove(toParent: self)

        topVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topVC.view.topAnchor.constraint(equalTo: bannerVC.view.bottomAnchor, constant: 20),
            topVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topVC.view.heightAnchor.constraint(equalToConstant: 200)
        ])

        let liveVC = LiveViewController()
        addChild(liveVC)
        contentView.addSubview(liveVC.view)
        liveVC.didMove(toParent: self)

        liveVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            liveVC.view.topAnchor.constraint(equalTo: topVC.view.bottomAnchor, constant: 20),
            liveVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            liveVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            liveVC.view.heightAnchor.constraint(equalToConstant: 180),
        ])
        
        let movieVC = MovieViewController()
        addChild(movieVC)
        contentView.addSubview(movieVC.view)
        movieVC.didMove(toParent: self)

        movieVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieVC.view.topAnchor.constraint(equalTo: liveVC.view.bottomAnchor, constant: 20),
            movieVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieVC.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let baseballVC = BaseballViewController()
        addChild(baseballVC)
        contentView.addSubview(baseballVC.view)
        baseballVC.didMove(toParent: self)

        baseballVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baseballVC.view.topAnchor.constraint(equalTo: movieVC.view.bottomAnchor, constant: 20),
            baseballVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            baseballVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            baseballVC.view.heightAnchor.constraint(equalToConstant: 90),
        ])
        
        let brandVC = BrandViewController()
        addChild(brandVC)
        contentView.addSubview(brandVC.view)
        brandVC.didMove(toParent: self)

        brandVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandVC.view.topAnchor.constraint(equalTo: baseballVC.view.bottomAnchor, constant: 20),
            brandVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            brandVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            brandVC.view.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        let masterpieceVC = MasterpieceViewController()
        addChild(masterpieceVC)
        contentView.addSubview(masterpieceVC.view)
        masterpieceVC.didMove(toParent: self)

        masterpieceVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            masterpieceVC.view.topAnchor.constraint(equalTo: brandVC.view.bottomAnchor, constant: 20),
            masterpieceVC.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            masterpieceVC.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            masterpieceVC.view.heightAnchor.constraint(equalToConstant: 210), 

            masterpieceVC.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

struct PreviewProvider_MainViewController: PreviewProvider {
    static var previews: some View {
        MainViewController().toPreview()
    }
}

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
