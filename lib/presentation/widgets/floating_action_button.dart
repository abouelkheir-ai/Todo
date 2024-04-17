// floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: const Text('Add Note'),
//                 content: TextField(
//                   onChanged: (value) {
//                     note = value;
//                   },
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text("cancel"),
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         addNoteCubit.addNote(Note(
//                             userId: widget.email!,
//                             task: note,
//                             finished: false));
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('Add'))
//                 ],
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),