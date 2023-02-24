import 'dart:developer';

import 'package:betahealth/core/constants/firebase_constants.dart';
import 'package:betahealth/core/failure.dart';
import 'package:betahealth/core/providers/firebase_provider.dart';
import 'package:betahealth/core/type_defs.dart';
import 'package:betahealth/models/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final notesRepositoryProvider = Provider((ref) {
  return NotesRepository(firestore: ref.watch(firestoreProvider));
});

class NotesRepository {
  final FirebaseFirestore _firestore;
  NotesRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  //! add notes
  FutureVoid addNotes(NoteModel note) async {
    try {
      return right(_notes.doc(note.id).set(note.toMap()));
    } on FirebaseException catch (e) {
      log(e.message!);
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get notes
  Stream<List<NoteModel>> getUserNotes(String uid) {
    return _notes
        .where('uid', isEqualTo: uid)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => NoteModel.fromMap(e.data() as Map<String, dynamic>))
            .toList());
  }

  // get the individual notes to read
  Stream<NoteModel> getNoteById(String noteId) {
    return _notes.doc(noteId).snapshots().map(
        (event) => NoteModel.fromMap(event.data() as Map<String, dynamic>));
  }

  //! delete note
  FutureVoid deleteNote(NoteModel note) async {
    try {
      return right(_notes.doc(note.id).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // update note
  FutureVoid updateNote(NoteModel note) async {
    try {
      return right(_notes.doc(note.id).update(note.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // search notes
  Stream<List<NoteModel>> searchNotes(String query, String uid) {
    // List<String> keywords = query.split(" ");
    return _notes
        .where('uid', isEqualTo: uid)
        // .where('content', arrayContainsAny: keywords)
        .where(
          'content',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<NoteModel> notes = [];
      for (var note in event.docs) {
        notes.add(NoteModel.fromMap(note.data() as Map<String, dynamic>));
      }

      return notes;
    });
  }

  CollectionReference get _notes =>
      _firestore.collection(FirebaseConstants.notesCollection);

  // CollectionReference get _users =>
  //     _firestore.collection(FirebaseConstants.usersCollection);
}
