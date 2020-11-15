import UIKit

// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
// URL Components
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!



struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey{
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artist: String
    let thumbnailPath: String
    
    enum CodingKeys: String, CodingKey{
        case title = "trackName"
        case artist = "artistName"
        case thumbnailPath = "artworkUrl30"
    }
    
    
    /*
    {"wrapperType":"track", "kind":"song", "artistId":320373708, "collectionId":1335980959, "trackId":1335980962, "artistName":"G-DRAGON", "collectionName":"One of a Kind - EP", "trackName":"Crayon", "collectionCensoredName":"One of a Kind - EP", "trackCensoredName":"Crayon", "artistViewUrl":"https://music.apple.com/us/artist/g-dragon/320373708?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/crayon/1335980959?i=1335980962&uo=4", "trackViewUrl":"https://music.apple.com/us/album/crayon/1335980959?i=1335980962&uo=4",
    "previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview128/v4/d0/b4/a2/d0b4a20f-fa58-af3e-5519-a4ff0d2e66f7/mzaf_5618631130566217831.plus.aac.p.m4a", "artworkUrl30":"https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/ef/89/d8/ef89d852-98d0-a3f4-969f-c75389ba462a/source/30x30bb.jpg", "artworkUrl60":"https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/ef/89/d8/ef89d852-98d0-a3f4-969f-c75389ba462a/source/60x60bb.jpg", "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/ef/89/d8/ef89d852-98d0-a3f4-969f-c75389ba462a/source/100x100bb.jpg", "collectionPrice":2.99, "trackPrice":1.29, "releaseDate":"2012-09-15T12:00:00Z", "collectionExplicitness":"explicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":6, "trackNumber":2, "trackTimeMillis":196920, "country":"USA", "currency":"USD", "primaryGenreName":"K-Pop", "isStreamable":true},
     */
}


let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
        
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    // 목표: 서버에서 받은 데이터를 트랙리스트 오브젝트로 변환하기
    
    // 구현하고 싶은 목록
    // - Data -> Track 목록으로 가져오고 싶다, [Track] 의 형태로
    // - 이를 위해선 Track 오브젝트를 만들어야겠다
    // - Data에서 Struct로 파싱하고 싶다 (response data를 쓸 수 있도록 파싱한다는 뜻) -> Codable 을 이용해서 만들자
    //   - Json 형태의 파일, 데이터를 오브젝트로 만들 때, Codable을 이용할 것이다
    //   - Response Data 를 들여다 보면, results 뒤에 Track 들이 있는 형태.
    
    // 해야 할 일
    // - Struct Response, Track
    //   - Struct 의 프로퍼티 이름과 Response 의 데이터 키와 이름 맞추기 (Codable 중 Decoding이 가능하도록)
    // - 파싱하기 (Decoding: Json -> Struct)
    // - 트랙리스트 가져오기
    
    // 파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("---> Track Count: \(tracks.count)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
    
    
//    print("---> resultData: \(resultData)")
//    print("---> resultString: \(resultString)")
    
    
}

dataTask.resume()
