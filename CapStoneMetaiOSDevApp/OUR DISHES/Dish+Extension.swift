import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItemStruct],
                                 _ context:NSManagedObjectContext)  {
         menuItems.forEach { menuItem in
             if !checkDishExists(name: menuItem.title, context) {
                 let dish = Dish(context: context)
                 
                 dish.name = menuItem.title
                 dish.price = Float(menuItem.price) ?? 0
             }
        }
    }
    static func checkDishExists(name:String,
                           _ context:NSManagedObjectContext) -> Bool {
        let fetchRequest:NSFetchRequest<Dish> = Dish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do {
            let dishes = try context.fetch(fetchRequest)
            return !dishes.isEmpty
        } catch {
            return false
        }
    }
    
}
