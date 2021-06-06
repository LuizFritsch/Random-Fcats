import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/views/views.dart';
import 'repositories/repositories.dart';
import 'home/bloc/bloc.dart';
import 'package:dio/dio.dart';

void main() {
  final factRepository = FactRepository(fac: FactApiClient(dio: Dio()));
  final imageRepository = ImageRepository(iac: ImageApiClient(dio: Dio()));
  runApp(MyApp(
    repository: factRepository,
    imageRepository: imageRepository,
  ));
}

class MyApp extends StatelessWidget {
  final FactRepository repository;
  final ImageRepository imageRepository;

  const MyApp({Key key, this.repository, this.imageRepository})
      : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RepositoryProvider.value(
        value: (context) {
          return [repository, imageRepository];
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FactBloc(
                factRepository: repository,
                imageRepository: imageRepository,
              ),
            ),
          ],
          child: Home(),
        ),
      ),
    );
  }
}
