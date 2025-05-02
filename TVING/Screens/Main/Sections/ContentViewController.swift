//
//  ContentViewController.swift
//  TVING
//
//  Created by 선영주 on 5/2/25.
//

import UIKit
import SnapKit
import Then

class ContentViewController: UIViewController {

    // MARK: - UI 컴포넌트

    private let scrollView = UIScrollView().then {
        $0.contentInsetAdjustmentBehavior = .never
    }

    private let contentView = UIView()

    // MARK: - 생명주기

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        setupSections()
    }

    // MARK: - 스크롤뷰 설정

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
    }

    // MARK: - 섹션 추가

    private func setupSections() {

        let bannerVC = BannerViewController()
        addChild(bannerVC)
        contentView.addSubview(bannerVC.view)
        bannerVC.didMove(toParent: self)

        bannerVC.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }

        let topVC = TopViewController()
        addChild(topVC)
        contentView.addSubview(topVC.view)
        topVC.didMove(toParent: self)

        topVC.view.snp.makeConstraints { make in
            make.top.equalTo(bannerVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(230)
        }

        let liveVC = LiveViewController()
        addChild(liveVC)
        contentView.addSubview(liveVC.view)
        liveVC.didMove(toParent: self)

        liveVC.view.snp.makeConstraints { make in
            make.top.equalTo(topVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }

        let movieVC = MovieViewController()
        addChild(movieVC)
        contentView.addSubview(movieVC.view)
        movieVC.didMove(toParent: self)

        movieVC.view.snp.makeConstraints { make in
            make.top.equalTo(liveVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }

        let baseballVC = BaseballViewController()
        addChild(baseballVC)
        contentView.addSubview(baseballVC.view)
        baseballVC.didMove(toParent: self)

        baseballVC.view.snp.makeConstraints { make in
            make.top.equalTo(movieVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(85)
        }

        let brandVC = BrandViewController()
        addChild(brandVC)
        contentView.addSubview(brandVC.view)
        brandVC.didMove(toParent: self)

        brandVC.view.snp.makeConstraints { make in
            make.top.equalTo(baseballVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }

        let masterpieceVC = MasterpieceViewController()
        addChild(masterpieceVC)
        contentView.addSubview(masterpieceVC.view)
        masterpieceVC.didMove(toParent: self)

        masterpieceVC.view.snp.makeConstraints { make in
            make.top.equalTo(brandVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(180)
        }

        let footerVC = FooterViewController()
        addChild(footerVC)
        contentView.addSubview(footerVC.view)
        footerVC.didMove(toParent: self)

        footerVC.view.snp.makeConstraints { make in
            make.top.equalTo(masterpieceVC.view.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(130)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
