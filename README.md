# Alpflix

A Netflix-style iOS app built with UIKit that allows users to browse movies and TV shows, watch trailers, and save their favorites for offline viewing.

## Features

- Browse trending movies and TV shows
- Search for specific titles
- Watch trailers via YouTube integration
- Download titles for offline viewing
- Modern UIKit interface with smooth animations
- Core Data integration for local storage
- Dark mode support

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.0+

## Installation

1. Clone the repository:
```bash
git clone https://github.com/alperencerkezz/Alpflix.git
```

2. Install dependencies (if using CocoaPods):
```bash
cd Alpflix
pod install
```

3. Create a `Config.swift` file based on `Config.example.swift` and add your API keys:
```swift
struct Config {
    static let TMDB_API_KEY = "YOUR_TMDB_API_KEY"
    static let YOUTUBE_API_KEY = "YOUR_YOUTUBE_API_KEY"
}
```

4. Open `Alpflix.xcworkspace` (or `Alpflix.xcodeproj` if not using CocoaPods) in Xcode.

## API Keys

This project requires two API keys:

1. TMDB API Key - Get it from [The Movie Database](https://www.themoviedb.org/documentation/api)
2. YouTube API Key - Get it from [Google Cloud Console](https://console.cloud.google.com/)

## Architecture

- MVVM Architecture
- Protocol-Oriented Programming
- Dependency Injection
- Core Data for persistence

## Third-Party Libraries

- SDWebImage for image loading and caching

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for the movie data API
- [YouTube Data API](https://developers.google.com/youtube/v3) for trailer integration

- <p align="center">
  <img src="https://github.com/alperencerkezz/Alpflix/blob/4a4e894ca2e774fb7653cc51a2e7fcdbaf65ec60/1.png" width="300">
  <img src="https://github.com/alperencerkezz/Alpflix/blob/4a4e894ca2e774fb7653cc51a2e7fcdbaf65ec60/2.png" width="300">
  <img src="https://github.com/alperencerkezz/Alpflix/blob/4a4e894ca2e774fb7653cc51a2e7fcdbaf65ec60/3.png" width="300">
</p>
