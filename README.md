# PosePerfect 🧘

A Flutter mobile app that uses your phone's camera and machine learning to detect
and classify yoga poses in real time.

> ⚠️ This project is currently a work in progress — core ML pipeline is built but
> the app is not fully functional yet. Active fixes in progress.

---

## What it does

- Opens your phone camera and streams live frames
- Runs an on-device ML model to detect body keypoints
- Classifies the detected pose against known yoga poses
- Gives real-time feedback on which pose you're holding

---

## Tech stack

| Layer | Tech |
|---|---|
| Mobile app | Flutter (Dart) |
| Pose detection | ML Kit / MediaPipe |
| Camera feed | camera Flutter plugin |
| On-device inference | TensorFlow Lite |

---

## Project structure

```
pose_perfect/
├── lib/
│   ├── main.dart
│   ├── camera_view.dart        # live camera feed
│   ├── pose_detector.dart      # ML inference logic
│   └── pose_classifier.dart    # pose label matching
├── assets/
│   └── model/                  # TFLite model files
└── pubspec.yaml
```

---

## Current status

| Feature | Status |
|---|---|
| Camera feed | ✅ Working |
| Pose keypoint detection | ✅ Working |
| Yoga pose classification | 🔧 In progress |
| Real-time feedback UI | 🔧 In progress |
| Android build | 🔧 In progress |
| iOS build | ⏳ Not started |

---

## Known issues

- Model inference pipeline has integration issues with the Flutter camera stream
- App crashes on certain Android versions during camera initialisation
- Pose classification labels need refinement

---

## Roadmap

- [ ] Fix camera-to-model pipeline
- [ ] Add support for 10+ yoga poses
- [ ] Show pose name and confidence score on screen
- [ ] Add rep counter for held poses
- [ ] Deploy as APK for Android

---

## Run locally

```bash
flutter pub get
flutter run
```

> Requires Flutter 3.x and a physical device or emulator with camera support.

---

## Learning outcomes

- Integrating TensorFlow Lite models into a Flutter app
- Working with real-time camera streams on mobile
- On-device ML inference without a backend
- Pose estimation using body keypoint detection

---

