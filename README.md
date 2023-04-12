
# Rick and Morty APP

## /dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  # injector
  get_it: ^7.2.0
  # Bloc for state management
  flutter_bloc: ^8.1.2
  # Bloc
  bloc: ^8.1.1
  # Value equality
  equatable: ^2.0.5
  # Functional programming thingies
  dartz: ^0.10.1
  #import dio
  dio: ^5.1.1
  #animate rive
  rive: ^0.9.1
  #import flutter_svg
  flutter_svg: ^1.1.6
  #freezed functional programming
  freezed_annotation: ^2.2.0
dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0
  mockito: ^5.4.0
  freezed: ^2.3.2
  build_runner: ^2.3.3
```


# Pages

## Login Page
Requires any text to be provided in the email and password field.

![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/loginScreen.png)

## Home Page
All scrolls allow you to request a new page when the list limit is reached.
![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/homeScreen.png)

## Search Page
All scrolls allow you to request a new page when the list limit is reached.
![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/buscadorScreen.png)

## Episode Page
All scrolls allow you to request a new page when the list limit is reached.
![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/episodeScreen.png)

## Character Page
All scrolls allow you to request a new page when the list limit is reached.
![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/characterScreen.png)

## Drawer
All scrolls allow you to request a new page when the list limit is reached.
![App Screenshot](https://github.com/LuisCMad/RickAndMorty/blob/main/assetsReadme/NavegadorDrawer.png)

# Arquitectura del proyecto
```
├───core
│   ├───error
│   └───usecases
└───features
    ├───data
    │   ├───datasources
    │   ├───models
    │   └───repositories
    ├───domain
    │   ├───entities
    │   ├───repositories
    │   └───usecases
    └───ui
        ├───bloc
        │   ├───characterBloc
        │   ├───episodeBloc
        │   └───searchCharacter
        ├───components
        ├───episodeBloc
        ├───pages
        └───utils
```
