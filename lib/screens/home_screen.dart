import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_t_evolvers/providers/person_provider.dart';
import 'package:reto_t_evolvers/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //List<Person> listPersons = [];

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);

    if (personProvider.listPersons.isNotEmpty) {
      return SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 30),
              TitleScreen(),
              SizedBox(height: 15),
              SearchButton(),
              SizedBox(height: 15),
              GridView.builder(
                itemCount: personProvider.listPersons.length,
                addRepaintBoundaries: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 220,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //print(index);
                  return PersonCard(person: personProvider.listPersons[index]);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      personProvider.getPersons();
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}

/*

Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: FloatingActionButton(
                  backgroundColor: Colors.grey,
                  elevation: 0,
                  child: const Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    print('Personaje favorito num: 1');
                  },
                ),
              )
            ],
          ),
 */