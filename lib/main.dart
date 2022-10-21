import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Story view',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delicious Indian Meals"),
      ),
      body: Container(
        margin: EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title:
                    "Hello world!\nHave a look at some great Indian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                    backgroundColor: Colors.orange,
                    roundedTop: true,
                  ),

                  StoryItem.inlineImage(
                    url:
                    "https://b.zmtcdn.com/data/pictures/chains/1/18138461/370ca63602a4992579e05daa42a1846b.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*",
                    controller: controller,
                    caption: Text(
                      "Indian Cuisine; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://qph.cf2.quoracdn.net/main-qimg-b5351c59fcd70572ed0228af1c9ba860-lq",
                    controller: controller,
                    caption: Text(
                      "Dosa's, Samosa and all",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreStories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View more stories",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageVideo(
              "https://vod-progressive.akamaized.net/exp=1666332400~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4975%2F15%2F399876918%2F1705865533.mp4~hmac=9afb63e8ee0fdca615d91a864295ce993af85ff4d97d741a1978744b0a3ecaf7/vimeo-prod-skyfire-std-us/01/4975/15/399876918/1705865533.mp4",
              controller: storyController,
          ),
          StoryItem.pageVideo(
              "https://vod-progressive.akamaized.net/exp=1666332875~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2674%2F20%2F513373860%2F2375645356.mp4~hmac=cc610234ebeaae7d2a4d71296bc993351977c218bcbd67fc494d937f0e6ebe0b/vimeo-prod-skyfire-std-us/01/2674/20/513373860/2375645356.mp4",
              controller: storyController
          ),
          StoryItem.pageImage(
            url:
            "https://content.jdmagicbox.com/comp/def_content/chole-bhature-outlets/6-chole-bhature-outlets-6-u8yl7.jpg?clr=444422",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media4.giphy.com/media/SasDDqOSRclNu/giphy.gif?cid=790b76112a2185133f31732d0b672826aa137118f9e90380&rid=giphy.gif&ct=g",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media3.giphy.com/media/3BMQ1y0Ytt6jb3JAdI/giphy.webp?cid=ecf05e47g3mtgt3nli324i0f1m850ruax7id5zuanu3atr9r&rid=giphy.webp&ct=g",
            caption: "Hello, from the cake hut",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
