
This is a complete avatar package that you can use for your profile and avatar

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

```yaml
dependencies:
  avatar: ^0.0.1
```

## How to use

```dart
import 'package:avatar/avatar.dart';

```

## How to install

### Android

- To request permissions from the user, you can use the following code: AndroidManifest.xml.

```
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

```
- Add UCropActivity into your AndroidManifest.xml
````xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
````

### iOS
- No configuration required

### Web
- Add following codes inside `<head>` tag in file `web/index.html`:

```html
<head>
  ....

  <!-- Croppie -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" />
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/exif-js/2.3.0/exif.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>

  ....
</head>
```

## example

```dart
 Avatar.avatarCircle(
onTapAvatar: () {},
radius: 35,
text: avatar[index],
randomGradient: true,
randomColor: false,
),,
```

```dart
Avatar.profile(
radius: 35,
text: avatar[index],
randomGradient: true,
randomColor: false,
),                           
```


```dart
ImageBlur.ImageDownloadBlur(
imageUrl: imageUrls[index],
),
```

## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [zagros.development.group@gmail.com](mailto:zagros.development.group@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.

For more information about this package, you can also visit our [GitHub repository](https://github.com/Swan1993/image_blur) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.

Thank you for using our package, and we look forward to hearing from you!
