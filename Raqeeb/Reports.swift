import SwiftUI
import SwiftData

struct Reports: View {
    @Environment(\.modelContext) private var modelContext  // SwiftData context
    @Query private var nubaItems: [Nuba]  // Fetch existing nuba items from the model
    @State private var showAddSheet = false // to control sheet display
    @State private var type = ""
    @State private var startTime = Date() // وقت البداية
    @State private var endTime = Date() // وقت النهاية
    @State private var date = Date() // تاريخ النوبة
    @State private var currentPage: String = "Reports" // Default to Reports

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("النوبات")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        showAddSheet = true
                    }) {
                        Image(systemName: "plus.circle") // plus icon
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                if nubaItems.isEmpty {
                    Spacer()
                    Text("لا توجد بيانات")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                } else {
                    List {
                        ForEach(nubaItems) { nuba in
                            NubaBox(nuba: nuba)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        deleteNuba(nuba)
                                    } label: {
                                        Label("حذف", systemImage: "trash")
                                    }
                                   // .tint(Color("pur")) // لون السحب
                                }
                        }.listRowBackground(Color.clear)
                    }.scrollContentBackground(.hidden)
//                    .listStyle(PlainListStyle()) // لجعلها تتصرف مثل ScrollView
//                    .background(Color.clear) // الحفاظ على الخلفية الأصلية
                       
                }

                Spacer()

                HStack {
                    VStack(spacing: 4) {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("التقرير")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)

                    NavigationLink(destination: ContentView()) {
                        VStack(spacing: 4) {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("الرئيسية")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color("pur")) // استبدال الخلفية بلون pur
            }
            .background(Color("pur").edgesIgnoringSafeArea(.all)) // استخدام اللون الأصلي
            .sheet(isPresented: $showAddSheet) {
                AddSeizureSheet(
                    type: $type,
                    startTime: $startTime,
                    endTime: $endTime,
                    date: $date,
                    onSave: {
                        let duration = Calendar.current.dateComponents([.minute], from: startTime, to: endTime).minute ?? 0

                        let timeFormatter = DateFormatter()
                        timeFormatter.dateFormat = "HH:mm"
                        
                        let formattedStartTime = timeFormatter.string(from: startTime)
                        let formattedEndTime = timeFormatter.string(from: endTime)

                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let formattedDate = dateFormatter.string(from: date)

                        let newNuba = Nuba(
                            type: type,
                            duration: "\(formattedStartTime) - \(formattedEndTime) (\(duration) دقيقة)", // إضافة وقت البداية والنهاية والمدة
                            date: formattedDate
                        )
                        
                        modelContext.insert(newNuba)
                        do {
                            try modelContext.save()
                        } catch {
                            print("Failed to save new Nuba: \(error)")
                        }
                        showAddSheet = false
                        type = ""
                        startTime = Date()
                        endTime = Date()
                        date = Date()
                    }
                )
            }
        }
        .navigationBarBackButtonHidden(true)  // إخفاء زر الرجوع
    }

    private func deleteNuba(_ nuba: Nuba) {
        modelContext.delete(nuba)
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete Nuba: \(error)")
        }
    }
}

struct AddSeizureSheet: View {
    @Binding var type: String
    @Binding var startTime: Date // وقت البداية
    @Binding var endTime: Date // وقت النهاية
    @Binding var date: Date // تاريخ النوبة
    var onSave: () -> Void

    var body: some View {
        ZStack {
            Color("lightPur") // استبدال اللون الأبيض بـ pur
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("إضافة نوبة")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)

                TextField("نوع النوبة", text: $type)
                    .padding()
                    .foregroundStyle(Color("white")) // خلفية نوع النوبة
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)

                DatePicker("وقت البداية", selection: $startTime, displayedComponents: .hourAndMinute)
                    .padding()
                    .background(Color("pur")) // خلفية وقت البداية
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)

                DatePicker("وقت النهاية", selection: $endTime, displayedComponents: .hourAndMinute)
                    .padding()
                    .background(Color("pur")) // خلفية وقت النهاية
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)

                DatePicker("تاريخ النوبة", selection: $date, displayedComponents: .date)
                    .padding()
                    .background(Color("pur")) // خلفية تاريخ النوبة
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)

                Button(action: {
                    onSave()
                }) {
                    Text("أضف")
                        .frame(width: 200)
                        .padding()
                        .background(Color("pur"))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }

                Spacer()
            }
        }
    }
}


