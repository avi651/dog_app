import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injector_container.dart';
import 'presentation/bloc/all_dog_bloc/all_dog_bloc.dart';
import 'presentation/bloc/all_dog_bloc/all_dog_event.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  dependencyInjection();
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<DogAllBreedBloc>()
              ..add(
                FetchAllDogBreed(),
              ),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
