// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// void signIn(BuildContext context, String email, String password) async {
//   try {
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     // Handle successful sign-in (navigate to another screen, show a success message, etc.)
//     print('User signed in: ${userCredential.user!.uid}');
//   } catch (error) {
//     if (error is FirebaseAuthException) {
//       String errorMessage = '';
//       switch (error.code) {
//         case 'invalid-email':
//           errorMessage = 'Invalid email address format.';
//           break;
//         case 'user-not-found':
//           errorMessage = 'User with this email does not exist.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Invalid password.';
//           break;
//         case 'user-disabled':
//           errorMessage = 'This user account has been disabled.';
//           break;
//         default:
//           errorMessage = 'Failed to sign in. Please try again later.';
//           break;
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//         ),
//       );
//     } else {
//       // Handle other sign-in errors
//       print('Failed to sign in: $error');
//     }
//   }
// }
