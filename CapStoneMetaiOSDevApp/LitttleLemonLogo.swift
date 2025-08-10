import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("littleLemon").resizable().frame(width: 130, height: 50).aspectRatio(contentMode: ContentMode.fit)
    }
}

struct LittleLemonLogo_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonLogo()
    }
}


