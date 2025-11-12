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
            ForEach(viewModel.songs, id: \.id) { song in
                SongItem(song: song)
            }
        }
        .onAppear {
            viewModel.add(song: Song(id: 1, title: "Golden", singer: "HUNTR/X"))
            viewModel.add(song: Song(id: 2, title: "Drowning", singer: "WOODZ"))
            viewModel.add(song: Song(id: 3, title: "Soda Pop", singer: "Saja Boys"))
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
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
    }
}

struct TextSinger: View {
    let singer: String
    var body: some View {
        Text(singer)
            .font(.caption)
            .foregroundColor(.gray)
            .padding()
    }
}

#Preview {
    ContentView()
}
