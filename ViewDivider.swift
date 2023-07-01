import SwiftUI

struct ViewDivider: View {
    var body: some View {
        Rectangle() // Used as a custom divider to divide sectons in the app
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct ViewDivider_Previews: PreviewProvider {
    static var previews: some View {
        ViewDivider()
    }
}

