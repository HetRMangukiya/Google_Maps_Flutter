# Google Maps in Flutter with GetX Controller - Step 07

This repository contains the code for implementing Google Maps in a Flutter application using GetX for state management. This step-by-step guide is designed to complement the YouTube video tutorial available [here](https://youtu.be/cRYueO3Tegg).

## Overview

In this project, you'll learn how to:

- Integrate Google Maps into a Flutter application.
- Use GetX for state management.
- Search and navigate to specific locations on the map.
- Display suggestions in a dropdown as the user types in the search field.
- Add markers to the map dynamically based on user input.

## Features

- **Google Maps Integration:** Display a Google Map with markers.
- **GetX State Management:** Manage the state of the application using GetX.
- **Search Functionality:** Search for locations and navigate to them on the map.
- **Dynamic Suggestions:** Show suggestions in a dropdown as the user types in the search field.

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter installed on your local machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
- A Google Maps API key. Obtain it from the [Google Cloud Console](https://console.cloud.google.com/).

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/HetRMangukiya/Google_Maps_Flutter.git
   cd google-maps-flutter-getx
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get

   ```

3. **Add your Google Maps API key:**
* Open android/app/src/main/AndroidManifest.xml and add your API key inside the meta-data tag.

   ```bash
   <meta-data
  android:name="com.google.android.geo.API_KEY"
  android:value="YOUR_API_KEY"/>
   ```

**Code Structure** 

   ```bash
   ├── lib/
   │   ├── controllers/
   │   │   └── map_controller.dart
   │   ├── pages/
   │   │   └── map_page.dart
   │   ├── widgets/
   │   │   └── custom_map.dart
   │   └── main.dart
   ├── pubspec.yaml
   └── README.md
   ```

## What's New in Part-2

In this part of the series, we have added the following features:

- **Map Type Selection:** Users can switch between different types of maps, such as Default, Satellite, and Terrain.
- **Country, District, and Road Names:** Names of countries, districts, roads, and other map details are displayed, even in Satellite view.
- **Search Location:** Users can search for any location by entering the name or address, with dynamic suggestions appearing as they type.
- **Single Marker Addition:** When a user selects a location, a marker is added to that specific spot on the map.

For a detailed walkthrough of these features, check out the YouTube video for Part-2 [Tap here](https://www.youtube.com/watch?v=ffbWopren0g).

## Screenshots

<p float="left">
  <img src="https://github.com/user-attachments/assets/df4a72e6-29fe-4ded-a88f-7d676180c51c" alt="Screenshot 1" width="200"/>
  <img src="https://github.com/user-attachments/assets/12f253b0-e075-46ac-9c66-cb9eaaa6f52b" alt="Screenshot 2" width="200"/>
  <img src="https://github.com/user-attachments/assets/938cc814-52b3-4a17-888c-074e98757c40" alt="Screenshot 3" width="200"/>
  <img src="https://github.com/user-attachments/assets/2f226c2c-c513-41f2-a6e8-2bb00341d1fa" alt="Screenshot 4" width="200"/>
</p>
