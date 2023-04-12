import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talenti_test/features/domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: 300,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.deepPurple[900]?.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    'Status :' + character.status,
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    'Species :' + character.species,
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    'Gender :' + character.gender,
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    'Origin :' + character.origin,
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(character.image)),
                ],
              ),
            ),
          ),
          //SvgPicture.asset(iconSrc),
        ],
      ),
    );
  }
}
