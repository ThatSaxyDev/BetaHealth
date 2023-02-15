import 'package:betahealth/features/notes/controllers/notes_controller.dart';
import 'package:betahealth/features/notes/widgets/notes_tile.dart';
import 'package:betahealth/shared/widgets/error_text.dart';
import 'package:betahealth/shared/widgets/loader.dart';
import 'package:betahealth/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchNoteDelegate extends SearchDelegate {
  final WidgetRef ref;
  SearchNoteDelegate(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(PhosphorIcons.x),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ref.watch(searchNoteProvider(query)).when(
          data: (notes) => ListView.builder(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 15.h),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NotesTile(note: note);
            },
          ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
