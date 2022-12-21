// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notesapp/helpers/helpers.dart';
import 'package:notesapp/models/note.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  final _txtJudulController = TextEditingController();
  final _txtIsiController = TextEditingController();

  Future<void> _editNotes(int index) async {
    //edit notes
    Note notes = Note(
      judul: _txtJudulController.text,
      isi: _txtIsiController.text,
    );

    Future<List<Note>> newNotes = updateNotes(index, notes);
    List<Note> notesNew = await newNotes;
    Navigator.pop(context, notesNew);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    Map<String, dynamic> data = args as Map<String, dynamic>;
    int index = data['index'];
    Note note = data['note'];

    _txtIsiController.text = note.isi!;
    _txtJudulController.text = note.judul!;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Notes')),
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
              height: 15,
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
                _editNotes(index);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
