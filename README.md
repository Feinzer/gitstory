# gitstory

A new Flutter project.

### [Get the app here](https://github.com/Feinzer/gitstory/releases) 
or run the project by following the steps below


## Running the project

### 1. [Install flutter](https://docs.flutter.dev/get-started/install)

### 2. Clone the project
```
git clone https://github.com/Feinzer/gitstory.git
cd gitstory
```

### 3. Install dependencies
```
flutter pub get
```

### 4. Create the environment file
```
touch lib/env.local.dart
```

### 5. Fill the environment file like this
```
const String owner = "github-user";
const String repo = "github-repo";
const String accessToken = "github-personal-token";

```

### 6. [Connect an android device via ADB](https://developer.android.com/tools/adb#Enabling)

### 7. Running the project
```
flutter run --release
```