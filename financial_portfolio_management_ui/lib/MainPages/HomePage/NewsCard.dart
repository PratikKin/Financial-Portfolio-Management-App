import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final String url;
  final String title;
  final String imageLink;
  final String date;

  const NewsCard(
      {super.key,
      required this.url,
      required this.title,
      required this.imageLink,
      required this.date});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(widget.url);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.white12,
              width: 1.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side image
              Container(
                width: 100,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.imageLink, // Placeholder image URL
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 8.0), // Add spacing between image and text
              // Right side column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Large text limited to certain characters
                    Text(
                      widget.title,
                      maxLines: 2,
                      // Limit to 2 lines
                      overflow: TextOverflow.ellipsis,
                      // Show ellipsis if overflow
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // Add spacing between text and date
                    // Date
                    Text(
                      widget.date.substring(10),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
