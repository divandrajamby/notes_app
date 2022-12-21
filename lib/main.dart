// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notesapp/ui/home/home.dart';
import 'package:notesapp/ui/login/login.dart';
import 'package:notesapp/ui/notes/add.dart';
import 'package:notesapp/ui/notes/edit.dart';
import 'package:notesapp/ui/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp',
      theme: ThemeData(
        //warna primer
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          headline6: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Poppins',
            color: Colors.pink,
          ),
        ),
        //warna background body
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          //warna background header atas
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          titleTextStyle: TextStyle(
            //warna teks header atas
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          iconTheme: IconThemeData(
            //warna icon pada header atas
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          //warna background kartu untuk list notes
          color: Colors.white,
          elevation: 10,
          shadowColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //warna background tombol
            primary: Colors.pink,
            textStyle: const TextStyle(
              //warna teks pada tombol
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/add-notes': (context) => const AddNotesScreen(),
        '/edit-notes': (context) => const EditNotesScreen(),
      },
    );
  }
}
