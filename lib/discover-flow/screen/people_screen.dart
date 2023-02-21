import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/discover-flow/screen/people_portfolio_screen.dart';
import 'package:reel_folio/discover-flow/services/discover_service.dart';

import '../../util/asset.dart';
import '../../util/colors.dart';
import '../../util/size_config.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarybgcolor,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          var peopleResponse = ref.watch(peopleProvider);

          return peopleResponse.when(
            data: (peopleData) => ListView(
              scrollDirection: Axis.vertical,
              children: [
                ...peopleData!.data!
                    .map((e) => peopleListItemWidget(context, e.name!,
                        e.primaryRole ?? ' ', e.coverPicture ?? '', e.id!))
                    .toList(),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
            error: (__, _) => const Text(''),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget peopleListItemWidget(
      BuildContext context, String name, String primaryRole, String coverPic, int id) {
    List<String> items = name.split(' ');

    List<String> roles = primaryRole.split(' ');

    print('https://reelfolioapi.qworkz.co.uk/$coverPic');

    return Stack(
      // alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: Image.network(
              'https://reelfolioapi.qworkz.co.uk/$coverPic',
              errorBuilder: (BuildContext context, exception, stackTrace) {
                return Image.asset(
                  ReelfolioImageAsset.homePeopleImage1,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                );
              },
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: screenHeight! * 0.03, left: screenWidth! * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items.length > 1
                    ? '${items[0].toUpperCase()}\n${items[1].toUpperCase()}'
                    : name.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 43,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: screenHeight! * 10 / 812),
              Text(
                roles.length > 1
                    ? '${roles[0].toUpperCase()}\n${roles[1].toUpperCase()}'
                    : primaryRole.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(
              top: screenHeight! * 150 / 812, right: screenWidth! * 0.1),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(68, 26)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(width: 1.5, color: Colors.white),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PeoplePortfolioScreen(id: id),
                ),
              );
            },
            child: const Text(
              "View",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
