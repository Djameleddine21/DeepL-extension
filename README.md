# DeepL Extension

This is an extension with flutter web, usefel when copy text from PDF and the text have a lot of '\n' and it will show a duplicate words because of that, So with this extension we can remove those back line.

## Create a copy on your laptop ?
- Clone the repo
- Run : 
```dart
flutter pub get
flutter build web --web-renderer html --csp
```
- On your build/web go to index.html file and add this style to the html tag :
> html style="height: 600px; width: 400px"
