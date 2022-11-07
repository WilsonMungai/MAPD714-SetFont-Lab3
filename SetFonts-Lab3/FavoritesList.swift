import Foundation
import UIKit

class FavoritesList
{
    // Class property that returns an instance of the class FavoritesList
    static let sharedFavoritesList = FavoritesList()
    
    // Property to hold the name of favorite fonts
    private(set) var favorites:[String]
    
    // Sets the current content of the favorites array
    init()
    {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String) {
        if let index = favorites.firstIndex(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    
   

}
