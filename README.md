# Luxury Cars

A pocket guide to eight legendary car marques: Rolls-Royce, Bugatti, BMW, Bentley, Mercedes-Benz, Porsche, Ferrari and Lamborghini.

## Features

- **Showroom:** Every marque, oldest first, with its story, key facts and signature models.
- **Timeline:** The big moments from all eight brands on one line, from the 1886 Motorwagen to today's electric flagships.
- **Quiz:** Ten quick questions drawn from the app's own content, including "which marque makes this car?". Your best score is saved.
- **Garage:** Tap the heart next to any model to save it. Grouped by brand, shareable, and kept on device.

Works fully offline, in light and dark mode, on iPhone and iPad.

## Requirements

- Xcode 16 or later
- iOS 17 or later

## Project layout

```
Cars/
├── CarsApp.swift        App entry, splash and tab bar
├── Theme.swift          Design system: serif titles, gold accent, shared styles
├── Model/               Brand, Garage (saved models), Quiz (question generator)
├── Data/Brands.swift    All brand content in one place
└── Views/               Showroom, brand detail, timeline, quiz, garage, splash
```

The `Cars` folder is synced with the Xcode project, so new files are picked up automatically.
