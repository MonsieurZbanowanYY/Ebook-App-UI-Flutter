// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String imageURL;
  final String title;
  final String author;
  final double rating;

  const DetailsPage({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.author,
    required this.rating,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black.withOpacity(0.95) : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.white.withOpacity(0.02)
                                  : Colors.black.withOpacity(0.02),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05,
                                vertical: size.height * 0.05,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: size.height * 0.4,
                                  width: size.width * 0.8,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      //ebook image
                                      widget.imageURL,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.025,
                            ),
                            child: Container(
                              height: size.height * 0.04,
                              width: size.height * 0.04,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  //go back to home page
                                  onTap: () => Navigator.pop(
                                    context,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: size.height * 0.025,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Text(
                          //ebook title
                          widget.title,
                          style: GoogleFonts.poppins(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: size.height * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Text(
                          //ebook author
                          widget.author,
                          style: GoogleFonts.poppins(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.5)
                                : Colors.black.withOpacity(0.5),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.005,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //rating
                            Text(
                              'Rating - ${widget.rating}',
                              softWrap: true,
                              style: GoogleFonts.questrial(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.yellow,
                                size: size.height * 0.02,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055),
                        child: Align(
                          child: Text(
                            //TODO: add ebook description
                            //ebook description
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae elementum odio, at convallis est. Curabitur elit sapien, consectetur quis eleifend non, tempus id justo. Etiam facilisis magna quis nisl tempor blandit. Sed nec dapibus purus.",
                            style: GoogleFonts.poppins(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.018,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.8,
                      child: InkWell(
                        //todo: add read action
                        onTap: () => print('Read'),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            gradient: LinearGradient(
                              stops: const [0.4, 2],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: isDarkMode
                                  ? [
                                      Colors.indigo,
                                      Colors.black,
                                    ]
                                  : [
                                      Colors.indigo,
                                      Colors.white,
                                    ],
                            ),
                          ),
                          child: Align(
                            child: Text(
                              'Read',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
