import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteButton extends StatelessWidget {
  final Function onPressed;
  final bool favoriteColor;
  const FavoriteButton(
      {Key? key, required this.onPressed, this.favoriteColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        height: 50,
        elevation: 0,
        color: favoriteColor ? Colors.green : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color.fromARGB(255, 84, 212, 88),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              favoriteColor ? Icons.favorite : Icons.favorite_border,
              color: favoriteColor
                  ? Colors.white
                  : Color.fromARGB(255, 84, 212, 88),
            ),
            Text(
              favoriteColor ? ' En favoritos' : ' Añadir a favoritos',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                color: favoriteColor
                    ? Colors.white
                    : Color.fromARGB(255, 84, 212, 88),
              ),
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
