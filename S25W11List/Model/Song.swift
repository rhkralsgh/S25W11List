import Foundation

struct Song: Identifiable {
    let id: UUID = UUID()
    let title: String
    let singer: String
}
