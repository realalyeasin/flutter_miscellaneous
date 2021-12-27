import 'package:flutter/material.dart';

import 'TextWrapper.dart';

class TWHomePage extends StatefulWidget {
  const TWHomePage({Key? key}) : super(key: key);

  @override
  _TWHomePageState createState() => _TWHomePageState();
}

class _TWHomePageState extends State<TWHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Text Wrapper',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextWrapper(
                text:
                    'War and Peace is an historical epic that tells the story of Russia’s wars with Napoleon at the beginning of the nineteenth century, culminating in Napoleon’s failed invasion of Russia in 1812.  Considered by many critics to be the greatest novel ever created, War and Peace was written and published before Anna Karenina, from 1865 to 1869 (when Tolstoy was in his late 30s), and it traces the journeys of four aristocratic families—the Bezukhovs, Bolkonskies, Rostovs and Kuragins—whose personal lives become caught up in the tumultuous events of the time.'
        "In War and Peace, Tolstoy maintains a delicate balance between stirring scenes of major historical events and intimate portraits of daily life. In 361 chapters (approximately 1500 pages), the author moves back and forth between ballrooms and battlefields, marriages and massacres, private lives and public spectacles. No character is too small and no subject too large ""for"" Tolstoy's broad literary canvas. He depicts a vast array of characters (nearly 600 in all) from all walks of life, each one of them remarkably real and irreducibly individual. In fact, Tolstoy's realism has had such a lasting impact that even today an ordinary Russian can usually recall in colorful detail how their favorite character in War and Peace speaks, dresses and behaves, as ""if"" the character were someone from their own life."),
            Divider(
              height: 30,
            ),
            TextWrapper(
              text : "Of the important messages in War and Peace, one is that every human being is sacred and integrally connected with one another. While none of us can control the large, impersonal forces of history, war and death, each of us can make positive choices in our everyday lives—choices that help create happiness for ourselves, our families, and our communities. History, Tolstoy tells us, is what happens to us. Destiny is what we do with it."
            ),

          ],
        ),
      ),
    );
  }
}
