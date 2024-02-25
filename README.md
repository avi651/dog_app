# dog_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

The first version of project (v1.0) is just about UI + simple logic. In this version v1.0, I applied BloC pattern by using Flutter Bloc to project and also have unit tests for it. I also built simple Mock API for the app.

II. Showcase

2.1. Dog Ceo App

In Home screen, it just simply load then show data to UI. What you can try. We have created two seperate widgets and add onto our home screen.
(2) On Clicking on Dog breed list it will open the dog breed image respectively. We have also used Caching for the images.

III. API

https://dog.ceo/api
API 	Usage
/breeds/list/all	Return data for all dog breed
/breed/african/images/random/10	Return data for top 10 breed images

IV. Plugins
Plugin 	Usage
mockito For mocking for api test cases
http 	SAA
build_runner 	SAA
flutter_bloc 	For build app architecture
equatable 	SAA
shimmer 	Animate image place holder
test 	Try to use unit testing, most of the cases come from Bloc
bloc_test 	SAA
dartz SAA
get_it SAA
skeletonizer SAA
cached_network_image SAA
sqflite SAA
path_provider SAA
permission_handler SAA
like_button SAA
build_runner  SAA
equatable SAA
uuid SAA

[√] Android Studio (version 3.8)
    • Flutter plugin version 3.0.1
    • Dart plugin version 192.8052

VS Code (version 1.88.0)
• Flutter extension can be installed from:
https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter