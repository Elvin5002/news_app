# News App

A dynamic and feature-rich news application built with **Kotlin**. This app enables users to stay updated with the latest news across various categories and sources.

## Features

- **Categorized News**: Browse news by categories like Sports, Health, Business, Technology, and more.
- **Search News**: Search for articles using keywords.
- **Filter by Sources**: View news from specific sources or channels.

## Screenshots

| Home Screen | Category Screen | Article Detail |
|-------------|-----------------|----------------|
| ![Home Screen](assets/screenshots/home.jpg) | ![Category Screen](assets/screenshots/category.jpg) | ![Article Detail](screenshots/details.jpg) |

## Technologies Used

- **Kotlin**: Programming language for Android development.
- **Retrofit**: HTTP client for API calls.
- **MVVM Architecture**: Ensures a clean and maintainable codebase.
- **Room Database**: Local database for storing bookmarks.
- **LiveData**: Observes and reacts to data changes.
- **Coroutines**: Handles asynchronous tasks efficiently.
- **Glide**: Loads and displays images seamlessly.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/news-app.git
   cd news-app
   ```

2. Open the project in Android Studio.

3. Build the project and run it on an emulator or a physical device.

4. Obtain an API key from [NewsAPI](https://newsapi.org/) and add it to your `local.properties` file:
   ```properties
   NEWS_API_KEY=your_api_key_here
   ```

## How to Use

1. Launch the app on your device.
2. Browse the home screen to view top news.
3. Navigate to specific categories using the bottom navigation.
4. Click on an article to view details.
5. Use the bookmark button to save articles for later.
6. Search for news using the search bar.

## Upcoming Features

- **Push Notifications**: Get real-time updates on breaking news.
- **User Preferences**: Personalize your feed by selecting favorite categories and sources.
- **Multi-Language Support**: View news in different languages.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Submit a pull request explaining your changes.

---

### Acknowledgments

- Thanks to [NewsAPI](https://newsapi.org/) for providing a robust API for news data.
- Kotlin and Android communities for their resources and support.
