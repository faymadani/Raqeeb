import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext  // SwiftData context
    @State private var showingAddNubaView = false
    @State private var nubaType: String = ""
    @State private var nubaDuration: String = ""
    @State private var nubaDate: String = ""
    

    var body: some View {
        
        NavigationView {
            ZStack {
                Color.pur
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer().frame(height: 50)
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("أهلاً محمد")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("كيف حال صحتك اليوم؟")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                   // .frame(maxWidth: .infinity, alignment: .trailing)

                    Spacer().frame(height: 10)

//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("النوبات")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//
//                        Text("انتقل إلى صفحة التقارير لعرض النوبات.")
//                            .foregroundColor(.gray)
//                            .frame(width: 166, height: 100)
//                            .background(Color.black.opacity(0.3))
//                            .cornerRadius(10)
//                    }
//
                    Spacer()

                    // Navigation Bar with NavigationLink
                    HStack {
                        NavigationLink(destination: Reports()) { // Navigate to Reports View
                            VStack {
                                Image(systemName: "chart.bar")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("التقرير")
                                    .font(.caption)
                            }
                            .foregroundColor(.gray)
                        }
                        Spacer()
                        NavigationLink(destination: ContentView()) { // Navigate to Reports View
                            VStack {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("الرئيسية")
                                    .font(.caption)
                            }
                            .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                    .background(Color.black.opacity(0.3))
                }
            }
            .navigationBarBackButtonHidden(true)  // Hide the back button
            .sheet(isPresented: $showingAddNubaView) {
                AddNubaView(
                    nubaType: $nubaType,
                    nubaDuration: $nubaDuration,
                    nubaDate: $nubaDate,
                    onSave: saveNuba
                )
            }
        }
    }

    private func saveNuba() {
        // Ensure fields are not empty
        guard !nubaType.isEmpty, !nubaDuration.isEmpty, !nubaDate.isEmpty else {
            return
        }

        // Create new Nuba and save to the model context
        let newNuba = Nuba(type: nubaType, duration: nubaDuration, date: nubaDate)
        modelContext.insert(newNuba)

        // Save changes to the model
        do {
            try modelContext.save()
        } catch {
            print("Failed to save new Nuba: \(error)")
        }

        // Reset fields and close the add view
        nubaType = ""
        nubaDuration = ""
        nubaDate = ""
        showingAddNubaView = false
    }
}








import SwiftUI
import SwiftData
//struct NubaBox: View {
//    var nuba: Nuba
//
//    var body: some View {
//        HStack(spacing: 5) {
//            Text("نوع النوبة: \(nuba.type)")
//                .font(.caption)
//                .foregroundColor(.white)
//            Text("مدة النوبة: \(nuba.duration)")
//                .font(.caption)
//                .foregroundColor(.white)
//            Text("تاريخ النوبة: \(nuba.date)")
//                .font(.caption)
//                .foregroundColor(.white)
//        }
//        .padding()
//        .frame(alignment: .leading)
//        .background(Color.black.opacity(0.3))
//        .cornerRadius(10)
//    }
//}


struct NubaBox: View {
    var nuba: Nuba

    var body: some View {
        VStack(spacing: 10) { // Stack elements vertically with space in between
            Text("\(nuba.type)")
                .font(.caption)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the right (RTL)

            Text("\(nuba.duration)")
                .font(.caption)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the right (RTL)

            Text("\(nuba.date)")
                .font(.caption)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the right (RTL)
        }
        .frame(width: 330, height: 100) // Set the width and height of the overall box
        .padding() // Padding around the content inside the box
        .background(Color("lightPur")) // Background with transparency
        .cornerRadius(25) // Fully rounded corners
        .padding(.horizontal) // Add padding around the box itself for spacing
        .environment(\.layoutDirection, .rightToLeft) // Set RTL layout direction globally
    }
}



// Unified sheet for adding Nuba (seizure) data
struct NubaInputSheet: View {
    @Binding var nubaType: String
    @Binding var nubaDuration: String
    @Binding var nubaDate: String
    var onSave: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("أدخل معلومات النوبة").frame(maxWidth: .infinity, alignment: .trailing)) {  // Align header to the left
                    // نوع النوبة
                    TextField("أدخل نوع النوبة", text: $nubaType)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    // مدة النوبة
                    TextField("أدخل مدة النوبة", text: $nubaDuration)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    // تاريخ النوبة
                    TextField("أدخل تاريخ النوبة", text: $nubaDate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }

                // زر الحفظ داخل الشيت
                Button(action: {
                    onSave() // Save the new Nuba and close the sheet
                }) {
                    Label("حفظ", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("إضافة نوبة", displayMode: .inline)
            .navigationBarItems(trailing: Button("إغلاق") {
                // Close the sheet if needed
            })
            .environment(\.layoutDirection, .rightToLeft)  // Set RTL layout direction for the sheet
        }
    }
}

