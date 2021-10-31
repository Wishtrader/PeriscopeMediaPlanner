import SwiftUI

struct Task: Codable, Identifiable {
  let id: String
  let time: String
  let description: String
  let isCompleted: Bool
  let priority: String
}
