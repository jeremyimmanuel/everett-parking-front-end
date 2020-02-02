# Everett Parking App
## Coughacks 2020 Project

## Team
Jeremy Tandjung : https://github.com/jeremyimmanuel <br>
Jun Zhen        : https://github.com/jpzhen <br>
Krish Kalai     : https://github.com/krishkalai07

## Problem
Residents and visitors find it difficult to find on street parking within the downtown area of Everett. Past parking utilization studies have shown there may be enough parking stalls in the downtown, but public perception is parking availability is a challenge.

## Solution
A mobile app that lets users see parking lots in Everett's downtown area based on Everett's 2015 Central Business District Parking map (https://coughacks.io/datasets/CBD%20PARKING%202015-Map.pdf).

We have separates repoes for the Front-end side (a mobile application) and the Back-end side (a sql-backed python flask server). You can visit the repoes through the link below:
Front-end:  https://github.com/jeremyimmanuel/everett-parking-front-end
Back-end:   https://github.com/jeremyimmanuel/everett-parking-back-end

# Front End
## Two Platforms, One Codebase
![Flutter logo](https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png)
For this project, we have decided to adopt Google's Flutter SDK to develop our app. For those of you who don't know, Flutter is a cross platform mobile app development that lets you develop both android and iOS applications all in one code base, written in Dart. You can visit the [official flutter website](https://flutter.dev) for more information.

## Goal
For this hackathon, we set our goals to at least get an MVP, which has the following requirements:
* User is able to find parking spots/lots
* User is able to see the capacity of each parking spots.
* User is able to identify what kind of lot it is (private, or public, etc)

## Google Maps
A map is a crucial part in this app as it shows the locations of various places in Everett __including__ the parking spaces/lots. Therefore, we decided to use Google Maps SDK as our map of choice.

## Datapoints
Since the resource that we have is a static image of the availale parking spots/lots, we made our own database-backed server and manually input it with the relevant coordinates. For the purpose of this hackathon, we took account of only 6 places as a proof of concept. Details about our server side (back-end) can be viewed in the back-end repo attached above.

## Results
[map homepage](map.PNG) 
[loc1 homepage](locInfo1.PNG)
[loc2 homepage](locInfo2.PNG)
[desc box](desc.PNG)

We managed to make an mvp case

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
