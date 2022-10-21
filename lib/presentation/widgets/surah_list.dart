import 'package:alquran/common/constant.dart';
import 'package:alquran/domain/entities/surah.dart';
import 'package:alquran/presentation/pages/surah_page.dart';
import 'package:flutter/material.dart';

class SurahList extends StatelessWidget {
  final Surah surah;

  SurahList(this.surah);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, SurahPage.route_name,
            arguments: surah.number);
      },
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kDarkPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '${surah.number}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(surah.englishName),
      subtitle: Text("${surah.numberOfAyahs} ayat"),
      trailing: SizedBox(
        width: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                surah.name,
                style: const TextStyle(
                    color: kMediumPurple, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_up,
                  color: kDarkPurple,
                ),
                iconSize: 20,
              ),
            ),
          ],
        ),
      ),
      shape: const Border(
        bottom: BorderSide(color: Colors.black12),
      ),
    );
  }
}
