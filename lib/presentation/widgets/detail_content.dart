import 'package:alquran/common/constant.dart';
import 'package:alquran/domain/entities/ayat.dart';
import 'package:alquran/domain/entities/detail_surah.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  final DetailSurah detailSurah;

  DetailContent(this.detailSurah);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kMediumPurple.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailSurah.englishName,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kDarkPurple,
                                ),
                      ),
                      Text(
                        detailSurah.englishNameTranslation,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: kDarkPurple,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: kDarkPurple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: kDarkPurple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark,
                          color: kDarkPurple,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 27,
                  left: 26,
                  child: Text(
                    '???????????? ?????????????? ?????????????????????????? ????????????????????',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/frame.png',
                    height: 80,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 15),
              child: ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: true),
                itemBuilder: (context, index) {
                  final ayats = detailSurah.ayahs[index + 1];
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: kDarkPurple),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${ayats.numberInSurah - 1}',
                            style: const TextStyle(color: kDarkPurple),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ayats.text,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: detailSurah.ayahs.length - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
