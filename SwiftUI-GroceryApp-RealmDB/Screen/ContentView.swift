//
//  ContentView.swift
//  SwiftUI-GroceryApp-RealmDB
//
//  Created by Reşat Kut on 4.09.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    @State private var isPresented: Bool = false
    @AppStorage("isDarkMode") var isDark = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if shoppingLists.isEmpty {
                    Text("No shopping lists!")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) { shoppingList in
                        NavigationLink {
                           ShoppingListItemsScreen(shoppingList: shoppingList)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(shoppingList.title)
                                Text(shoppingList.address)
                                    .opacity(0.4)
                            }
                        }
                       
                    }.onDelete(perform: $shoppingLists.remove)
                }
                
                    .navigationTitle("Grocery App")
                   
            }
            .sheet(isPresented: $isPresented, content: {
                AddShoppingListScreen()
            })
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    
                    Button(action: {
                       isDark.toggle()
                    }){
                        isDark ? Label("", systemImage: "lightbulb.fill") : Label("", systemImage: "lightbulb")
                    }
                    Button(action: {
                       isPresented  = true
                    }){
                        Image(systemName: "plus")
                    }
                }
        }
            .preferredColorScheme(isDark ? .dark : .light)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
