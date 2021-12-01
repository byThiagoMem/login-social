import 'package:flutter/material.dart';

enum SocialButtomType { email, google, facebook }

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final SocialButtomType socialButtomType;
  const SocialButton({Key? key, required this.onTap, required this.socialButtomType}) : super(key: key);

  String get image => socialButtomType == SocialButtomType.email
      ? 'assets/images/email_logo.png'
      : socialButtomType == SocialButtomType.google
          ? 'assets/images/google_logo.png'
          : socialButtomType == SocialButtomType.facebook
              ? 'assets/images/facebook_logo.png'
              : 'assets/images/apple_logo.png';

  String get title => socialButtomType == SocialButtomType.email
      ? 'Continuar sem login'
      : socialButtomType == SocialButtomType.google
          ? 'Continuar com o Google'
          : socialButtomType == SocialButtomType.facebook
              ? 'Continuar com o Facebook'
              : 'Continuar com a Apple';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black54),
          color: const Color(0xFF090D68).withOpacity(.1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  height: 28,
                  width: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(height: 64, width: 1, color: Colors.black54),
            Expanded(
              child: Text(
                title,
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
