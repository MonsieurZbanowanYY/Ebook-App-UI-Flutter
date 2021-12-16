// ignore_for_file: file_names

import 'package:ebook_app/screens/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Martin";
  // avatar author: https://www.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_10544688.htm#page=1&query=profile&position=18&from_view=keyword#position=18&page=1&query=profile
  String avatarURL =
      'https://image.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg';
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hello, $name!',
                              style: GoogleFonts.questrial(
                                color: Colors.indigo,
                                fontSize: size.height * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05,
                                  ),
                                  child: FaIcon(
                                    //notifications
                                    FontAwesomeIcons.bell,
                                    size: size.height * 0.03,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                CircleAvatar(
                                  //avatar
                                  radius: size.width * 0.05,
                                  backgroundColor: const Color(0xff0c121a),
                                  backgroundImage: NetworkImage(
                                    avatarURL,
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.green,
                                      size: size.width * 0.04,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.015,
                        ),
                        child: Center(
                          child: Container(
                            width: size.width * 0.95,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Row(
                              //searchbar
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.indigo,
                                    size: size.height * 0.03,
                                  ),
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintStyle: GoogleFonts.questrial(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: size.height * 0.02,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Search Ebook',
                                    ),
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.02,
                        ),
                        child: Text(
                          'Best Sellers',
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //best sellers
                            //TODO: connect ebooks to backend
                            buildBestSeller(
                              'https://covers.openlibrary.org/b/id/8396473-L.jpg', //imageURL
                              'The Da Vinci Code', //title
                              'Dan Brown', //author
                              3.9, //rating (double)
                              size, // size (Size)
                              isDarkMode, // dark mode boolean
                            ),
                            buildBestSeller(
                              'https://covers.openlibrary.org/b/id/11408440-L.jpg',
                              'The Lost Symbol',
                              'Dan Brown',
                              3.2,
                              size,
                              isDarkMode,
                            ),
                            buildBestSeller(
                              'https://covers.openlibrary.org/b/id/8238855-L.jpg',
                              'Quo vadis',
                              'Henryk Sienkiewicz',
                              2.0,
                              size,
                              isDarkMode,
                            ),
                            buildBestSeller(
                              'https://covers.openlibrary.org/b/id/10519441-L.jpg',
                              'The Two Towers',
                              'J.R.R. Tolkien',
                              4.8,
                              size,
                              isDarkMode,
                            ),
                            buildBestSeller(
                              'https://covers.openlibrary.org/b/id/9330540-L.jpg',
                              'Red Dragon',
                              'Thomas Harris',
                              4.2,
                              size,
                              isDarkMode,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01,
                        ),
                        child: Text(
                          'Best Rating',
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //vertical ebooks
                      //TODO: connect ebooks to backend
                      buildVerticalEbook(
                        'https://covers.openlibrary.org/b/id/368812-L.jpg',
                        'The dogs of war',
                        'Thomas Harris',
                        4.9,
                        size,
                        isDarkMode,
                      ),
                      buildVerticalEbook(
                        'https://covers.openlibrary.org/b/id/553066-L.jpg',
                        'James Bond',
                        'Frederick Forsyth',
                        4.8,
                        size,
                        isDarkMode,
                      ),
                      buildVerticalEbook(
                        'https://covers.openlibrary.org/b/id/10439107-L.jpg',
                        'The Odessa file',
                        'Alastair Dougall',
                        4.8,
                        size,
                        isDarkMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBestSeller(String imageURL, String title, String author,
      double rating, Size size, bool isDarkMode) {
    return InkWell(
      onTap: () {
        //navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              imageURL: imageURL,
              title: title,
              author: author,
              rating: rating,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
        child: SizedBox(
          width: size.width * 0.5,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageURL,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Transform.scale(
                        scale: 0.5,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation(
                            isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.022,
                  ),
                ),
              ),
              Text(
                author,
                textAlign: TextAlign.center,
                style: GoogleFonts.questrial(
                  color: isDarkMode ? Colors.white38 : Colors.black38,
                  fontSize: size.height * 0.018,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVerticalEbook(String imageURL, String title, String author,
      double rating, size, isDarkMode) {
    return InkWell(
      onTap: () {
        //navigate to details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              imageURL: imageURL,
              title: title,
              author: author,
              rating: rating,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.005,
        ),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
                width: size.width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                  vertical: size.height * 0.015,
                ),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Text(
                          title,
                          softWrap: true,
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        author,
                        style: GoogleFonts.questrial(
                          color: isDarkMode ? Colors.white38 : Colors.black38,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.005),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating - $rating',
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
