//
//  ContentView.swift
//  ToDo List
//
//  Created by Ariya Coleman on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First Thing", "Second Thing", "Third Thing", "Fourth Thing", "Fifth Thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove { indices, newoffset in
                    things.move(fromOffsets: indices, toOffset: newoffset)
                }
                .onDelete { indexSet in
                    things.remove(atOffsets: indexSet)
                    
                }
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }
}
