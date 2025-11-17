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
        HStack(spacing: 16) {
            ImageAlbum(albumUrl: makeAlbumUrl(id: song.id))
            VStack {
                TextTitle(title: song.title)
                TextSinger(singer: song.singer)
            }
        }
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

func makeAlbumUrl(id: UUID) -> URL {
    URL(string: "https://picsum.photos/80/80?random=/(id)")!
}

struct ImageAlbum: View {
    let albumUrl: URL
    var body: some View {
        AsyncImage(url: albumUrl) { image in
            image
                .image?.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ContentView()
}
