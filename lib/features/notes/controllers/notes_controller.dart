import 'dart:io';

import 'package:betahealth/core/providers/storage_repository_provider.dart';
import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:betahealth/features/notes/repos/notes_repos.dart';
import 'package:betahealth/models/note_model.dart';
import 'package:betahealth/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';

final notesControllerProvider =
    StateNotifierProvider<NotesController, bool>((ref) {
  final notesRepository = ref.watch(notesRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return NotesController(
    notesRepository: notesRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});

// provider to get all users notes
final getUserNotesProvider = StreamProvider.family((ref, String uid) {
  return ref.read(notesControllerProvider.notifier).getUserNotes(uid);
});

// provider for get notes byID
final getNoteByIdProvider = StreamProvider.family((ref, String noteId) {
  final noteController = ref.watch(notesControllerProvider.notifier);
  return noteController.getNoteById(noteId);
});

class NotesController extends StateNotifier<bool> {
  final NotesRepository _notesRepository;
  final StorageRepository _storageRepository;
  final Ref _ref;
  NotesController({
    required NotesRepository notesRepository,
    required StorageRepository storageRepository,
    required Ref ref,
  })  : _notesRepository = notesRepository,
        _storageRepository = storageRepository,
        _ref = ref,
        super(false);

  //! add notes
  void addNote({
    required BuildContext context,
    required String title,
    required String content,
    File? file,
  }) async {
    state = true;
    String noteId = const Uuid().v1();
    final user = _ref.read(userProvider)!;

    if (file != null) {
      final imageRes = await _storageRepository.storeFile(
        path: 'notes/${user.uid}',
        id: noteId,
        file: file,
      );

      imageRes.fold(
        (l) => showSnackBar(context, l.message),
        (r) async {
          final NoteModel note = NoteModel(
            uid: user.uid,
            id: noteId,
            title: title,
            content: content,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            photo: r,
          );

          final res = await _notesRepository.addNotes(note);
          state = false;

          res.fold(
            (l) => showSnackBar(context, l.message),
            (r) {
              showSnackBar(context, 'Note added!');
              Routemaster.of(context).pop();
            },
          );
        },
      );
    } else {
      final NoteModel note = NoteModel(
        uid: user.uid,
        id: noteId,
        title: title,
        content: content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final res = await _notesRepository.addNotes(note);
      state = false;

      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) {
          // showSnackBar(context, 'Note Added');
          Routemaster.of(context).pop();
        },
      );
    }
  }

  //! get notes
  Stream<List<NoteModel>> getUserNotes(String uid) {
    return _notesRepository.getUserNotes(uid);
  }

  //! getthe individual notes by Id
  Stream<NoteModel> getNoteById(String noteId) {
    return _notesRepository.getNoteById(noteId);
  }

  //! delete note
  void deleteNote(NoteModel note, BuildContext context) async {
    final res = await _notesRepository.deleteNote(note);

    res.fold(
      (l) => null,
      (r) => null,
    );
  }

  // update note
  void updateNote({
    required BuildContext context,
    required NoteModel theNote,
    required String title,
    required String content,
  }) async {
    state = true;
    NoteModel note = NoteModel(
      uid: theNote.uid,
      id: theNote.id,
      title: title,
      content: content,
      createdAt: theNote.createdAt,
      updatedAt: DateTime.now(),
    );

    final res = await _notesRepository.updateNote(note);

    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Note updated!');
      },
    );
  }
}
