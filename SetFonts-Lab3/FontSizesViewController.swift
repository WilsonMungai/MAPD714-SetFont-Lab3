
import UIKit

class FontSizesViewController: UITableViewController
    {
    var font: UIFont!
        private static let pointSizes: [CGFloat] =
                [9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144]
    
        private static let cellIdentifier = "FontNameAndSize"

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Sets the table to automatically calculate the correct row heights based on its contents
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]

    }
    
    // Gets a version of a font with a given size, based on a table row index
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont
    {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return FontSizesViewController.pointSizes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FontSizesViewController.cellIdentifier,
            for: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text =
            "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }
    
}
