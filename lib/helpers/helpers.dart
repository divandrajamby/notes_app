import 'dart:convert';

import 'package:notesapp/models/note.dart';
import 'package:notesapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isUserLogin() async {
  //init shared preferences
  final prefs = await SharedPreferences.getInstance();

  //get user from shared preferences
  final String? user = prefs.getString('user');

  //check if user is null
  if (user != null) {
    return true;
  } else {
    return false;
  }
}

Future<void> saveUser(User user) async {
  //init shared preferences
  final prefs = await SharedPreferences.getInstance();

  //save user to shared preferences
  String parseUser = user.toJson().toString();
  prefs.setString('user', parseUser);
}

Future<void> removeUser() async {
  //init shared preferences
  final prefs = await SharedPreferences.getInstance();

  //remove user from shared preferences
  prefs.remove('user');
}

Future<List<Note>> getNote() async {
  final prefs = await SharedPreferences.getInstance();
  List<String> notesEncoded = prefs.getStringList('notes') ?? [];
  return notesEncoded.map((note) => Note.fromJson(jsonDecode(note))).toList();
}

Future<List<Note>> saveNotes(Note notes) async {
  final prefs = await SharedPreferences.getInstance();
  List<Note> currentNotes = await getNote();
  List<Note> newNotes = [...currentNotes, notes];
  List<String> notesEncoded = newNotes.map((note) => jsonEncode(note)).toList();
  await prefs.setStringList('notes', notesEncoded);
  return newNotes;
}

Future<List<Note>> updateNotes(int index, Note notes) async {
  final prefs = await SharedPreferences.getInstance();
  List<Note> currentNotes = await getNote();
  List<Note> newNotes = currentNotes;
  newNotes[index] = notes;
  List<String> notesEncoded = newNotes.map((note) => jsonEncode(note)).toList();
  await prefs.setStringList('notes', notesEncoded);
  return newNotes;
}

Future<List<Note>> deleteNotes(int index) async {
  final prefs = await SharedPreferences.getInstance();
  List<Note> currentNotes = await getNote();
  List<Note> newNotes = currentNotes;
  newNotes.removeAt(index);
  List<String> notesEncoded = newNotes.map((note) => jsonEncode(note)).toList();
  await prefs.setStringList('notes', notesEncoded);
  return newNotes;
}
