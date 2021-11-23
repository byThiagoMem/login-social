import 'package:flutter/material.dart';

enum SocialButtomType { google, facebook }

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final SocialButtomType socialButtomType;
  const SocialButton({Key? key, required this.onTap, required this.socialButtomType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
          color: Colors.grey[400],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  socialButtomType == SocialButtomType.google ? 'assets/images/google_logo.png' : 'assets/images/facebook_logo.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(height: 64, width: 1, color: Colors.black),
            Expanded(
              child: Text(
                socialButtomType == SocialButtomType.google ? 'Entrar com google' : 'Entrar com facebook',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
