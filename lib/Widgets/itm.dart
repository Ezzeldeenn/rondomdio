import 'package:flutter/material.dart';

class Itemuse extends StatelessWidget {
 String Name,Image,Email;

 Itemuse({
   required this.Image,
   required this.Name,
   required this.Email,
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        CircleAvatar(radius: 30,backgroundImage: NetworkImage(Image),),
        const SizedBox(width:20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Name,style:const TextStyle(fontWeight: FontWeight.bold),),
            Text(Email),
          ],
        ),
      ],),
    );
  }
}
