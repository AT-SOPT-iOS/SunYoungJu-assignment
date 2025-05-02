//
//  MainViewController.swift
//  TVING
//
//  Created by 선영주 on 5/1/25.
//

import UIKit
import SwiftUI
import SnapKit
import Then

class MainViewController: UIViewController {

    // MARK: - UI 컴포넌트

    private let headerView = UIView().then {
        $0.backgroundColor = .black
    }

    private let tabBarView = UIView().then {
        $0.backgroundColor = .black
    }

    private let logoImageView = UIImageView(image: UIImage(named: "TVING_Main")).then {
        $0.contentMode = .scaleAspectFill
    }

    private let searchButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "Search"), for: .normal)
        $0.tintColor = .white
    }

    private let tvingImageView = UIImageView(image: UIImage(named: "TVING_Logo")).then {
        $0.contentMode = .scaleAspectFit
    }

    private let activeBar = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 1
    }

    private var tabButtons: [UIButton] = []
    private let buttonTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]

    private let pagingScrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }

    private var pageViews: [UIView] = []

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupHeaderView()
        setupTabBarView()
        setupPagingScrollView()
    }

    // MARK: - 헤더 설정

    private func setupHeaderView() {
        view.addSubview(headerView)
        [logoImageView, searchButton, tvingImageView].forEach { headerView.addSubview($0) }

        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }

        logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(0)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }

        tvingImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }

        searchButton.snp.makeConstraints { make in
            make.trailing.equalTo(tvingImageView.snp.leading).offset(-20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
    }

    // MARK: - 탭바 설정

    private func setupTabBarView() {
        view.addSubview(tabBarView)

        tabBarView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }

        let bottomLine = UIView().then {
            $0.backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 44/255, alpha: 1) // #2C2C2C
        }

        tabBarView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }

        var previousButton: UIButton? = nil

        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton(type: .system).then {
                $0.setTitle(title, for: .normal)
                $0.setTitleColor(.white, for: .normal)
                $0.titleLabel?.font = UIFont.pretendardRegular(ofSize: 17)
                $0.tag = index
                $0.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            }

            tabBarView.addSubview(button)
            tabButtons.append(button)

            button.snp.makeConstraints { make in
                if let previous = previousButton {
                    make.leading.equalTo(previous.snp.trailing).offset(30)
                } else {
                    make.leading.equalToSuperview().offset(10)
                }
                make.centerY.equalToSuperview()
            }

            previousButton = button
        }

        // activeBar 위치
        tabBarView.addSubview(activeBar)
        guard let firstButton = tabButtons.first else { return }

        activeBar.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(2)
            make.height.equalTo(2)
            make.width.equalTo(firstButton.snp.width).multipliedBy(0.8)
            make.centerX.equalTo(firstButton.snp.centerX)
        }
    }

    // MARK: - 페이지 스크롤뷰 설정

    private func setupPagingScrollView() {
        pagingScrollView.delegate = self
        view.addSubview(pagingScrollView)

        pagingScrollView.snp.makeConstraints { make in
            make.top.equalTo(tabBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        var previousPage: UIView? = nil

        // ⭐ 홈(콘텐츠) 뷰 추가
        let homeVC = ContentViewController()
        addChild(homeVC)
        pagingScrollView.addSubview(homeVC.view)
        homeVC.didMove(toParent: self)

        homeVC.view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.leading.equalToSuperview()
            make.height.equalTo(pagingScrollView.snp.height)
        }

        previousPage = homeVC.view
        pageViews.append(homeVC.view)

        // ⭐ 나머지 빈 페이지들 추가
        for _ in 1..<buttonTitles.count {
            let page = UIView().then {
                $0.backgroundColor = .black
            }
            pagingScrollView.addSubview(page)
            page.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(view.snp.width)
                make.height.equalTo(pagingScrollView.snp.height)
                make.leading.equalTo(previousPage!.snp.trailing)
            }

            previousPage = page
            pageViews.append(page)
        }

        previousPage?.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
    }

    // MARK: - 탭 버튼 액션

    @objc private func tabButtonTapped(_ sender: UIButton) {
        let page = sender.tag
        let offset = CGFloat(page) * pagingScrollView.frame.width
        pagingScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        moveActiveBar(to: page)
    }

    private func moveActiveBar(to index: Int) {
        guard index < tabButtons.count else { return }
        UIView.animate(withDuration: 0.3) {
            self.activeBar.center.x = self.tabButtons[index].center.x
        }
    }
}

// MARK: - ScrollView Delegate

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        moveActiveBar(to: pageIndex)
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

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif
