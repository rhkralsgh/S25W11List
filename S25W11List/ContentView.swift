import SwiftUI

struct ContentView: View {
    var body: some View {
        MyList()
    }
}

struct MyList: View {
    @State var viewModel = SongViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.songs) { song in
                SongItem(song: song)
            }
        }
        .onAppear {
            viewModel.add(song: Song(title: "Golden", singer: "HUNTR/X"))
            viewModel.add(song: Song(title: "Drowning", singer: "WOODZ"))
            viewModel.add(song: Song(title: "Soda Pop", singer: "Saja Boys"))
        }
    }
}

struct SongItem: View {
    let song: Song
    var body: some View {
        VStack {
            TextTitle(title: song.title)
            TextSinger(singer: song.singer)
        }
        .padding()
    }
}

struct TextTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
    }
}

struct TextSinger: View {
    let singer: String
    var body: some View {
        Text(singer)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.caption)
            .foregroundColor(.gray)
            .padding()
    }
}

#Preview {
    ContentView()
}
