//
//  SettingTableViewController.swift
//  SwipeToDoApp
//
//  Created by 前田航汰 on 2022/04/29.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var versionNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        versionNumber.text = version
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [1, 0] {
            // アプリを評価するボタンへ
            reviewApp()
        } else if indexPath == [1, 1] {
            // アプリをシェアするボタンへ
            shareApp()
        }
        // 選択された色がスーっと消えていく
        tableView.deselectRow(at: indexPath, animated: true)
    }

    private func reviewApp() {
        // TODO: 別のURLを指定中
        if let url = URL(string: "https://apps.apple.com/jp/app/easy-count/id1580335092?uo=4&action=write-review") {
            UIApplication.shared.open(url)
        }
    }

    private func shareApp() {
        // TODO: 文字を考える
        let shareText = """
        シンプルなカウントアプリ
        「EasyCount」

        最高にシンプル。
        最高に使いやすい。
        あなたに最高のカウント体験を。
        """

        let activityItems = [shareText] as [Any]

        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        // iPadでクラッシュするため、iPadのみレイアウトの変更
        if let popoverController = activityVC.popoverPresentationController {
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.sourceView = self.view
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        self.present(activityVC, animated: true)

    }

    @IBAction func didTapExitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}