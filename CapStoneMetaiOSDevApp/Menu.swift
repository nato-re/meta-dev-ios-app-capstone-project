//
//  Menu.swift
//  M4Exercise
//
//  Created by nato on 10/08/25.
//

import SwiftUI

struct MenuScreen: View {
    // Environment object to access the Core Data managed object context
    @Environment(\.managedObjectContext) private var viewContext

    // State variable for the search bar
    @State private var searchText = ""

    // Fetches all Dish entities from Core Data, sorted and filtered
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Dish.title, ascending: true)
        ],
        predicate: NSPredicate(value: true)
    )
    private var dishes: FetchedResults<Dish>
    @State private var selectedCategory: String? = nil
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]

    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack {
                        Text("Little Lemon")
                            .font(.largeTitle)
                            .padding(.top)
                        Text("Chicago")
                            .font(.title2)
                            .foregroundColor(.gray)

                        Text(
                            "We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."
                        )
                        .multilineTextAlignment(.center)
                        .padding()
                    }
                    Image("Hero")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .padding(10)

                }

                TextField("Search menu", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: searchText) { newValue in
                        dishes.nsPredicate = buildPredicate()
                    }
            }
            Text("ORDER FOR DELIVERY!")
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category)
                                .font(.subheadline)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    selectedCategory == category
                                        ? Color(
                                            red: 0.29,
                                            green: 0.36,
                                            blue: 0.34
                                        )
                                        : Color(red: 0.9, green: 0.9, blue: 0.9)
                                )
                                .cornerRadius(15)
                                .foregroundColor(
                                    selectedCategory == category
                                        ? .white : .black
                                )
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
            }
            .listStyle(.plain)
            List {
                ForEach(dishes) { dish in
                    HStack {
                        Text(
                            "\(dish.title ?? "Unknown") - $\(dish.price ?? "0.00")"
                        )
                        .font(.headline)

                        Spacer()

                        AsyncImage(url: URL(string: dish.image ?? "")) {
                            image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }.onAppear {
            getMenuData()
        }
    }

    // Method to fetch menu data from the server
    func getMenuData() {
        // Clear old data from the database before fetching new data
        PersistenceController.shared.clear()
        viewContext.reset()

        let urlString =
            "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let menuList = try? decoder.decode(MenuList.self, from: data)
                {
                    DispatchQueue.main.async {
                        for item in menuList.menu {
                            let newDish = Dish(context: viewContext)
                            newDish.title = item.title
                            newDish.image = item.image
                            newDish.price = item.price
                        }

                        try? viewContext.save()
                    }
                }
            }
        }.resume()
    }

    // Function to build a predicate for filtering the menu list
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }

    // Function to build sort descriptors for the menu list
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
}

#Preview {
    MenuScreen().environment(
        \.managedObjectContext,
        PersistenceController.shared.container.viewContext
    )
}
