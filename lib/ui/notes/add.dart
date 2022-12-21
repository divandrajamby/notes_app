// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notesapp/helpers/helpers.dart';
import 'package:notesapp/models/note.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _txtJudulController = TextEditingController();
  final _txtIsiController = TextEditingController();

  Future<void> _saveNotes() async {
    //save notes
    Note notes = Note(
      judul: _txtJudulController.text,
      isi: _txtIsiController.text,
    );

    Future<List<Note>> newNotes = saveNotes(notes);
    List<Note> notesNew = await newNotes;
    Navigator.pop(context, notesNew);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Notes')),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _txtJudulController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Judul',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _txtIsiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Isi',
              ),
              minLines: 15,
              maxLines: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _saveNotes();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
