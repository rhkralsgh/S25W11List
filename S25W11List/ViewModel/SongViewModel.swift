import Foundation

@Observable
class SongViewModel {
    private var _songs: [Song] = []
    
    var songs: [Song] {
        return _songs
    }

    func add(song: Song) {
        _songs.append(song)
    }
  
//    // 가능함
//    func add(song: Song) {
//        _songs += [song]
//    }
}
