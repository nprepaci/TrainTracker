//
//  ContentView.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 7/20/21.
//


import SwiftUI

struct ContentView: View {
    
    //let transform = CGAffineTransform(rotationAngle: -30 * (.pi / 180))
    
    init() {
        //UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //UINavigationBar.appearance().backgroundColor = .orange
        //let coloredAppearance = UINavigationBarAppearance()
        //coloredAppearance.backgroundColor = UIColor(backgroundColor)
        
        //UINavigationBar.appearance().standardAppearance = coloredAppearance
            //UINavigationBar.appearance().compactAppearance = coloredAppearance
            //UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
   }
    
    @StateObject var api = API()
    @State private var angle: Double = 0
    @State private var showingPopover = false
    @EnvironmentObject var test: SelectedStation
    @State var timediff = ""
    
    //var backgroundColor = Color(red: 31/255, green: 41/255, blue: 51/255, opacity: 1.0)
    var backgroundColor = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    var navigationButtonColor = Color(red: 183/255, green: 239/255, blue: 168/255, opacity: 1.0)
    
    var body: some View {
        NavigationView {
            ZStack {
                //Since nested in ZStack, this sets the background color
                backgroundColor.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(self.api.storedData.data, id: \.id) { index in
                        NavigationLink(destination: ArrivalsView(stationName: index.name ?? "", northRoute: index.n ?? [NS].init(), southRoute: index.s ?? [NS].init())) {
                            ListRow(stationName: index.name ?? "")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(backgroundColor)
                    }
                    .padding(.bottom, 40)
                }
                //.listRowSeparator(.hidden)
                .listStyle(PlainListStyle())
                .onAppear { api.loadData()}
                //.navigationBarHidden(true)
                .navigationBarTitle("Station").foregroundColor(.white).colorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            NavigationLink(destination: ChangeStationView()) {
                                Image(systemName: "slider.horizontal.3").foregroundColor(navigationButtonColor)
                            }.simultaneousGesture(TapGesture().onEnded{
                                angle += 360
                            }).rotationEffect(.degrees(angle))
                                .animation(.easeIn, value: angle)
                        }
                    }
                }
            }
        }
        .background(Color(red: 62/255, green: 76/255, blue: 89/255, opacity: 1.0))
    }
    
    
}

///CORE DATA MODEL
//import CoreData
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}





///ORIGINAL LIST
/////struct ContentView: View {
//
//    @StateObject var api = API()
//
//    var backgroundColor = Color(red: 31/255, green: 41/255, blue: 51/255, opacity: 1.0)
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                //Since nested in ZStack, this sets the background color
//                backgroundColor.edgesIgnoringSafeArea(.all)
//                List {
//                    ForEach(api.storedData.data, id: \.id) { index in
//                        NavigationLink(destination: ArrivalsView(stationName: index.name ?? "")) {
//                            ZStack {
//                                ListRow(stationName: index.name ?? "")
//                                //Text(index.n)
//                            }
//                        }
//                        .padding(.bottom, 40)
//                    }
//                    .listRowBackground(backgroundColor)
//                }
//                .listStyle(PlainListStyle())
//                .onAppear { api.loadData() }
//                .navigationBarHidden(true)
//            }
//        }
//        .background(Color(red: 62/255, green: 76/255, blue: 89/255, opacity: 1.0))
//    }
//}






//Old popover
//                        Button {
//                            angle += 360
//                            showingPopover = true
//                        } label: {
//                            Image(systemName: "slider.horizontal.3")
//                        }
//                        .popover(isPresented: $showingPopover) {
//                            ChangeStationView(stationName: String.init())
//                        }
//                        .rotationEffect(.degrees(angle))
//                        .animation(.easeIn, value: angle)
