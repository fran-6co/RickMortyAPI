# Rick and Morty App

Hi! My name is Fran, and this is the first app I am sharing publicly. This app is written in Swift using SwiftUI and requires iOS 17.

The app uses the well-known [Rick&MortyAPI](https://rickandmortyapi.com) to fetch the data. It also includes an image caching mechanism to reduce unnecessary data usage for users and decrease number of calls to server.

I will continue adding new features as I test them and see how they fit into this showcase app.



## Overview

The main view shows you a complete list of characters, you cand find and filter by genre, too. Then a detailed view for the purpose of navigating.



## MVVM Architecture

This project is built with MVVM, an architecture that separates presentation logic (View) from business logic (ViewModel) and data (Model). 

- **Model:** Defines the data retrieved, in this case, the characters from the TV series, and performs the API call. The model handles and structures the data so that it can be easily used by the ViewModel. In this app, the model includes the data structures for the characters as well as the functions for making requests to the [Rick&MortyAPI](https://rickandmortyapi.com/).
- **ViewModel:** Acts as an intermediary between the model and the view. It transforms the model data into a format that the view can present. Additionally, the ViewModel handles business logic and the state of the user interface. In this application, the ViewModel manages retrieving the character data, handling the image cache, and implementing filtering and searching logic.
- **View:** The view is responsible for the visual presentation of the data and user interaction. In iOS, this is implemented using views and view controllers (UIView and UIViewController). The view observes changes in the ViewModel and updates itself automatically when the data changes. In this application, the view includes a list of characters with the ability to filter by genre and navigate to detailed views of each character.



## Features

- **Complete List of Characters:** The main view shows a complete list of characters from the series.
- **Filter by genre:** You can filter characters by their genre.
- **Detailed View:** Each character has a detailed view with more information. And a Trailer Button to open a sheet with the trailer.
- **Image Cache:** Previously downloaded character images are cached to save data and improve performance.
- **API Calls:** The app makes calls to the Rick and Morty API, managing network errors and waiting times.



## Future Improvements

- **Add Features:** I will continue adding new features as I test them and see how they fit into this showcase app.
- **Cache Optimization:** Improve the caching strategy for images and data.
- **UI Enhancements:** Make adjustments and improvements based on user feedback and new features added.



## Feedback and feature requests

If you have any suggestions, issues, or feature requests, please submit an issue or contact me in here on any other [platform](https://github.com/fran-6co#hi--im-fran-ochoa).
