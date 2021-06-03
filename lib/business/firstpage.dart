import 'package:flutter/material.dart';

import 'package:new_app/business/colorfilters.dart';
import 'package:flutter/material.dart';
import 'package:new_app/business/splash.dart';

import 'package:new_app/config/palette.dart';

import 'buyer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   static final String title = 'Tech_Geeks';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Palette.purple),
//         home: MainPage(title: title),
//       );
// }
const DEFAULT_PROGRESS_PAGINATION = 0;

class MainPage extends StatefulWidget {
  // final String title;

  // const MainPage({
  //   // @required this.title,
  // });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Tech_Geeks'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // buildQuoteCard(),
            // buildRoundedCard(),
            // buildColoredCard(),
            buildImageCard0(),
            buildImageCard1(),
            buildImageCard(),
            // buildImageInteractionCard(),
          ],
        ),
      );

  // Widget buildQuoteCard() => Card(
  //       child: Padding(
  //         padding: EdgeInsets.all(12),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'If life were predictable it would cease to be life, and be without flavor.',
  //               style: TextStyle(fontSize: 24),
  //             ),
  //             const SizedBox(height: 12),
  //             Text(
  //               'Eleanor Roosevelt',
  //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // Widget buildRoundedCard() => Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       child: Container(
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Rounded card',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'This card is rounded',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // Widget buildColoredCard() => Card(
  //       shadowColor: Colors.red,
  //       elevation: 8,
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(24),
  //       ),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [Colors.redAccent, Colors.red],
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //           ),
  //         ),
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Colored card',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             Text(
  //               'This card is rounded and has a gradient',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              // image: AssetImage('business.png'),
              image: AssetImage(
                'business.jpeg',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
              height: 238,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Owner',
              style: TextStyle(
                backgroundColor: Colors.white70,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 48,
              ),
            ),
          ],
        ),
      );

  Widget buildImageCard1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              // image: AssetImage('business.png'),
              image: AssetImage(
                'employee.png',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {},
              ),
              height: 171,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Employee',
              style: TextStyle(
                backgroundColor: Colors.white70,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 48,
              ),
            ),
          ],
        ),
      );

  Widget buildImageCard0() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              // image: AssetImage('business.png'),
              image: AssetImage(
                'buyer.jpg',
              ),
              // colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyerPage()),
                  );
                },
              ),
              height: 238,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Buyer',
              style: TextStyle(
                backgroundColor: Colors.white70,
                fontWeight: FontWeight.bold,
                color: Palette.purple,
                fontSize: 48,
              ),
            ),
          ],
        ),
      );

  // Widget buildImageInteractionCard() => Card(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(24),
  //       ),
  //       child: Column(
  //         children: [
  //           Stack(
  //             children: [
  //               Ink.image(
  //                 image: NetworkImage(
  //                   'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
  //                 ),
  //                 height: 240,
  //                 fit: BoxFit.cover,
  //               ),
  //               Positioned(
  //                 bottom: 16,
  //                 right: 16,
  //                 left: 16,
  //                 child: Text(
  //                   'Cats rule the world!',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                     fontSize: 24,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(16).copyWith(bottom: 0),
  //             child: Text(
  //               'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
  //               style: TextStyle(fontSize: 16),
  //             ),
  //           ),
  //           ButtonBar(
  //             alignment: MainAxisAlignment.start,
  //             children: [
  //               FlatButton(
  //                 child: Text('Buy Cat'),
  //                 onPressed: () {},
  //               ),
  //               FlatButton(
  //                 child: Text('Buy Cat Food'),
  //                 onPressed: () {},
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     );
}
