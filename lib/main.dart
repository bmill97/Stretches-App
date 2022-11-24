import 'package:flutter/material.dart';
import 'package:sp/Stretch.dart';
import 'package:sp/StretchList.dart';
import 'package:sp/StretchScreen.dart';
import 'package:sp/MainPresenter.dart';

int widgetNumber = 0;

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stretches App',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEEF1EF)),
      home: MyHomePage(title: 'Stretches'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final MainPresenter presenter = MainPresenter();
  static const barColor = Color(0xff5e6572);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements StretchView{
  List<Stretch> stretchList = [];
  List<Stretch> armList = [Stretch("Bicep", "1. Place your thumb next to your other fingers\n"
        "2. Find a solid surface to push up against at a 45 degree angle\n"
        "3. Slowly turn your body away from the surface\n"
        "4. Hold that position for 20-30 seconds\n"
        "5. Switch arms and repeat", "https://www.youtube.com/watch?v=uqO6GGebKXA", 1),
      Stretch("Tricep", "1. Lift your elbow into the air\n"
          "2. Place your elbow behind your head, palm facing your body\n"
          "3. Gently pull your elbow futher behind to increase the stretch\n"
          "4. Switch arms and repeat", "https://www.youtube.com/watch?v=zzvDO56B0HE", 2),
      Stretch("Forearm", "1. Hold the palm of one hand with the other hand, while keeping your elbow straight on the affected arm\n"
          "2. Pull your hand back gently to feel a stretch in the forearm\n"
          "3. Hold the stretch for 20-30 seconds.", "https://www.youtube.com/watch?v=oQpskjE937M", 3),
      Stretch("Deltoid", "1. Reach one arm across your body, using your other arm or wrist to hold it gently by your upper arm\n"
          "2. Slowly begin to pull your arm toward your chest, as far as possible, allowing the stretch to reach deep into the back of your shoulder\n"
          "3. Pause, breathing deeply into the stretch. Hold for at least 30 seconds\n"
          "4. Release and repeat with the other arm", "https://www.youtube.com/watch?v=CPnpQVDzVgM", 4)];
  List<Stretch> legList = [Stretch("Quadriceps", "1. Stand near a wall or a piece of sturdy exercise equipment for support\n"
        "2. Grasp your ankle and gently pull your heel up and back until you feel a stretch in the front of your thigh.\n"
        "3. Tighten your stomach muscles to prevent your stomach from sagging outward, and keep your knees close together.\n"
        "4. Hold for about 30 seconds.\n"
        "5. Switch legs and repeat.", "https://www.youtube.com/watch?v=BZwmTXwu2fk", 11),
      Stretch("Calf", "1. While holding on to a chair, keep one leg back with your knee straight and your heel flat on the floor\n"
          "2. Slowly bend your elbows and front knee and move your hips forward until you feel a stretch in your calf\n"
          "3. Hold this position for 30 to 60 seconds\n"
          "4. Switch leg positions and repeat with your other leg", "https://www.youtube.com/watch?v=y01ri_43G50", 12),
      Stretch("Hamstring", "1. Lie on the floor near the outer corner of a wall or a door frame\n"
          "2. Raise your left leg and rest your left heel against the wall. Keep your left knee slightly bent\n"
          "3. Gently straighten your left leg until you feel a stretch along the back of your left thigh\n"
          "4. Hold for about 30 seconds\n"
          "5. Switch legs and repeat", "https://www.youtube.com/watch?v=2U4ChnuL3JM", 13),
      Stretch("Hips", "1. Lie on the back on the floor or a mat with both legs extended\n"
          "2. Move the left knee up to the chest. Use both hands to pull the knee gently closer to the chest\n"
          "3. Hold this stretch for 10 seconds before returning to the starting position\n"
          "4. Repeat with the other leg\n"
          "5. Perform this exercise 10 times on each leg\n", "https://www.youtube.com/watch?v=tT7W-F28TXo", 14),
      Stretch("Glutes", "1. Start on all fours. Move your right knee toward your right wrist, placing your shin on the floor. Move your right ankle toward your left wrist\n"
          "2. Slide your left leg back, point your toes, and keep your hips facing forward. Extend your spine\n"
          "3. Gently walk your hands forward. Hold for 5–10 breaths\n"
          "4. Return to the starting position. Switch legs and repeat\n","https://www.youtube.com/watch?v=jQMsyrLowFw", 15)];
  List<Stretch> backList = [Stretch("Lats", "1. Kneel on the floor with your hips and knees hip-width apart. The bench (or chair) is in front of you and far enough apart that your arms can fully extend\n"
        "2. Bend from the hips and slowly lean forward, keeping your spine straight and abdominals braced. Place your hands on the bench, keeping your arms straight and elbows in extension\n"
        "3. As you lean forward with your hands on the bench, your arms are in a straight line from the shoulders\n"
        "4. Lean back in the hips with the knees under your hips. Your hands stay on the bench with palms facing the ground\n"
        "5. The more you can lean back into your hips the more stretch you'll feel in the upper back. Ensuring your chin is tucked into the neck will help stabilize your cervical spine\n", "https://www.youtube.com/watch?v=izMQh1NeyRU", 21),
      Stretch("Trapzius (Traps)", "1. Push up onto all fours, into a tabletop position. Your hips should be directly over your knees, your shoulders over your elbows, and your elbows over your wrists\n"
        "2. As you inhale, lift your head, chest, and sitting bones, letting your belly sink, and arching your back\n"
        "3. As you exhale, round your spine toward the sky and release your head into the Cat pose\n"
        "4. Continue taking deep breaths, moving with your breath as you do, inhaling as you arch your back and exhaling as you round your back\n", "https://www.youtube.com/watch?v=lD9ZDwlHmmE", 22),
      Stretch("Lumbar", "1. With your hands and knees on the ground, sink back through your hips to rest them on your heels\n"
        "2. Hinge at your hips as you fold forward, walking your hands out in front of you\n"
        "3. Rest your belly on your thighs\n"
        "4. Extend your arms in front of or alongside your body with your palms facing up\n"
        "5. Focus on breathing deeply and relaxing any areas of tension or tightness\n"
        "6. Hold this pose for up to 1 minute", "https://www.youtube.com/watch?v=nMp3MlTz9fA", 23),
      Stretch("Rhomboids (Middle back)", "1. Begin in a seated position and grasp the bottom of your chair with your right hand and bring your left hand on your back of the head\n"
        "2. Turn your head towards your left armpit\n"
        "3. Then using your left arm, gently push your head down looking towards your left armpit until you feel a slight stretch along with right side of your neck\n"
        "4. Hold this position for 15 to 20 seconds\n"
        "5. Repeat on the opposite side\n"
        "6. Aim for 3 repetitions of this stretch on each side\n", "https://www.youtube.com/watch?v=GSoXPJRnR6E", 24)];
  List<Stretch> breathList = [Stretch("Belly Button Breathing", "1. Sit comfortably, with your knees bent and your shoulders, head and neck relaxed\n"
        "2. Place one hand on your upper chest and the other just below your rib cage. This will allow you to feel your diaphragm move as you breathe\n"
        "3. Breathe in slowly through your nose so that your stomach moves out against your hand. The hand on your chest should remain as still as possible\n"
        "4. Tighten your stomach muscles, so that your stomach moves back in, as you exhale through pursed lips. The hand on your upper chest must remain as still as possible", "https://www.youtube.com/watch?v=QRSbxS-uG9A", 31),
      Stretch("Pursed Lip Breathing", "1. Relax your neck and shoulder muscles\n"
            "2. Breathe in (inhale) slowly through your nose for two counts, keeping your mouth closed. Don't take a deep breath; a normal breath will do. It may help to count to yourself: inhale, one, two\n"
            "3. Pucker or \"purse\" your lips as if you were going to whistle or gently flicker the flame of a candle"
            "4. Breathe out (exhale) slowly and gently through your pursed lips while counting to four. It may help to count to yourself: exhale, one, two, three, four.", "https://www.youtube.com/watch?v=7kpJ0QlRss4", 32),
      Stretch("Mental Motivation", "1. Motivate Yourself With Your Mission\n"
            " - Invoke your broader mission and purpose in life as a powerful source of motivation. Apply that inspirational feeling and energy to your specific goals for the workout at hand\n"
            "2. Visualize Victory\n"
            " - See yourself vividly as already having crushed your workout. Use victorious memories from the past to infuse your vision with a feeling of inevitability. You can picture yourself successfully completing a set before you ever begin it to establish some early momentum\n"
            "3. Empty Your Mind\n"
            " - Put your attention on your breath, and allow it to deepen as you focus all your mental energy on the moment at hand. Do this until you’ve gotten out of your head, and into a more “flowing” state. When it comes time to train, your mind should only be on the exercises at hand", "https://www.youtube.com/watch?v=HnoPHqrdXQ8", 33)];

  bool displaySearch = false;
  String searchTerm = "";
  int index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final int selected = widgetNumber;

  @override
  void initState() {
    // final firebaseMessaging = FCM();
    // firebaseMessaging.setNotifications();
    widget.presenter.view = this;
    widget.presenter.fetchStretchList();
    super.initState();
  }

  @override
  void onStretchListUpdate() {
    setState(() {
      stretchList = widget.presenter.stretchList;
    });
    // Refresh stretch list - because of Stretch implementation, this must happen manually
  }

  List<Stretch> getStretches() {
    switch(widgetNumber){
      case 1:
        return armList;
        break;
      case 2:
        return legList;
        break;
      case 3:
        return backList;
        break;
      case 4:
        return breathList;
        break;
      default:
        print("switch broken, returning arm list");
        return armList;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color(0xff5e6572),
          centerTitle: true,
          actions: <Widget> [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),

          child: GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
                );
              },
              child: const Icon( //added const here
                  Icons.search,
                  size: 26.0,
                  color: Color(0xFF1C2321),
              )
          ),
        )
      ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Flexible(
                  child: StretchList(
                    stretches: getStretches(),
                    onItemClick: (Stretch stretch){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StretchScreen(stretch)));
                    },
                  )
              ),
          ]
        )
      ),
      bottomNavigationBar: BottomAppBar(
          key: _bottomNavigationKey,
          // index: 0,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: const Color(0xff5e6572),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/muscles.png'),
                    onPressed: () {
                      setState(() {
                        widgetNumber = 1;
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) =>
                                MyHomePage(title: 'Stretches')), (route) => false);
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/leg.png'),
                    onPressed: () {
                      setState(() {
                        widgetNumber = 2;
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) =>
                                MyHomePage(title: 'Stretches')), (route) => false);
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/chest.png'),
                    onPressed: () {
                      setState(() {
                        widgetNumber = 3;
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) =>
                                MyHomePage(title: 'Stretches')), (route) => false);
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/meditation.png'),
                    onPressed: () {
                      setState(() {
                        widgetNumber = 4;
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) =>
                                MyHomePage(title: 'Stretches')), (route) => false);
                      });
                    },
                  ),
                ],
              ))),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<Stretch> allStretches = [Stretch("Bicep", "1. Place your thumb next to your other fingers\n"
      "2. Find a solid surface to push up against at a 45 degree angle\n"
      "3. Slowly turn your body away from the surface\n"
      "4. Hold that position for 20-30 seconds\n"
      "5. Switch arms and repeat", "https://www.youtube.com/watch?v=uqO6GGebKXA", 1),
    Stretch("Tricep", "1. Lift your elbow into the air\n"
        "2. Place your elbow behind your head, palm facing your body\n"
        "3. Gently pull your elbow futher behind to increase the stretch\n"
        "4. Switch arms and repeat", "https://www.youtube.com/watch?v=zzvDO56B0HE", 2),
    Stretch("Forearm", "1. Hold the palm of one hand with the other hand, while keeping your elbow straight on the affected arm\n"
        "2. Pull your hand back gently to feel a stretch in the forearm\n"
        "3. Hold the stretch for 20-30 seconds.", "https://www.youtube.com/watch?v=oQpskjE937M", 3),
    Stretch("Deltoid", "1. Reach one arm across your body, using your other arm or wrist to hold it gently by your upper arm\n"
        "2. Slowly begin to pull your arm toward your chest, as far as possible, allowing the stretch to reach deep into the back of your shoulder\n"
        "3. Pause, breathing deeply into the stretch. Hold for at least 30 seconds\n"
        "4. Release and repeat with the other arm", "https://www.youtube.com/watch?v=CPnpQVDzVgM", 4),
    Stretch("Quadriceps", "1. Stand near a wall or a piece of sturdy exercise equipment for support\n"
        "2. Grasp your ankle and gently pull your heel up and back until you feel a stretch in the front of your thigh.\n"
        "3. Tighten your stomach muscles to prevent your stomach from sagging outward, and keep your knees close together.\n"
        "4. Hold for about 30 seconds.\n"
        "5. Switch legs and repeat.", "https://www.youtube.com/watch?v=BZwmTXwu2fk", 11),
    Stretch("Calf", "1. While holding on to a chair, keep one leg back with your knee straight and your heel flat on the floor\n"
        "2. Slowly bend your elbows and front knee and move your hips forward until you feel a stretch in your calf\n"
        "3. Hold this position for 30 to 60 seconds\n"
        "4. Switch leg positions and repeat with your other leg", "https://www.youtube.com/watch?v=y01ri_43G50", 12),
    Stretch("Hamstring", "1. Lie on the floor near the outer corner of a wall or a door frame\n"
        "2. Raise your left leg and rest your left heel against the wall. Keep your left knee slightly bent\n"
        "3. Gently straighten your left leg until you feel a stretch along the back of your left thigh\n"
        "4. Hold for about 30 seconds\n"
        "5. Switch legs and repeat", "https://www.youtube.com/watch?v=2U4ChnuL3JM", 13),
    Stretch("Hips", "1. Lie on the back on the floor or a mat with both legs extended\n"
        "2. Move the left knee up to the chest. Use both hands to pull the knee gently closer to the chest\n"
        "3. Hold this stretch for 10 seconds before returning to the starting position\n"
        "4. Repeat with the other leg\n"
        "5. Perform this exercise 10 times on each leg\n", "https://www.youtube.com/watch?v=tT7W-F28TXo", 14),
    Stretch("Glutes", "1. Start on all fours. Move your right knee toward your right wrist, placing your shin on the floor. Move your right ankle toward your left wrist\n"
        "2. Slide your left leg back, point your toes, and keep your hips facing forward. Extend your spine\n"
        "3. Gently walk your hands forward. Hold for 5–10 breaths\n"
        "4. Return to the starting position. Switch legs and repeat\n","https://www.youtube.com/watch?v=jQMsyrLowFw", 15),
    Stretch("Lats", "1. Kneel on the floor with your hips and knees hip-width apart. The bench (or chair) is in front of you and far enough apart that your arms can fully extend\n"
        "2. Bend from the hips and slowly lean forward, keeping your spine straight and abdominals braced. Place your hands on the bench, keeping your arms straight and elbows in extension\n"
        "3. As you lean forward with your hands on the bench, your arms are in a straight line from the shoulders\n"
        "4. Lean back in the hips with the knees under your hips. Your hands stay on the bench with palms facing the ground\n"
        "5. The more you can lean back into your hips the more stretch you'll feel in the upper back. Ensuring your chin is tucked into the neck will help stabilize your cervical spine\n", "https://www.youtube.com/watch?v=izMQh1NeyRU", 21),
    Stretch("Trapzius (Traps)", "1. Push up onto all fours, into a tabletop position. Your hips should be directly over your knees, your shoulders over your elbows, and your elbows over your wrists\n"
        "2. As you inhale, lift your head, chest, and sitting bones, letting your belly sink, and arching your back\n"
        "3. As you exhale, round your spine toward the sky and release your head into the Cat pose\n"
        "4. Continue taking deep breaths, moving with your breath as you do, inhaling as you arch your back and exhaling as you round your back\n", "https://www.youtube.com/watch?v=lD9ZDwlHmmE", 22),
    Stretch("Lumbar", "1. With your hands and knees on the ground, sink back through your hips to rest them on your heels\n"
        "2. Hinge at your hips as you fold forward, walking your hands out in front of you\n"
        "3. Rest your belly on your thighs\n"
        "4. Extend your arms in front of or alongside your body with your palms facing up\n"
        "5. Focus on breathing deeply and relaxing any areas of tension or tightness\n"
        "6. Hold this pose for up to 1 minute", "https://www.youtube.com/watch?v=nMp3MlTz9fA", 23),
    Stretch("Rhomboids (Middle back)", "1. Begin in a seated position and grasp the bottom of your chair with your right hand and bring your left hand on your back of the head\n"
        "2. Turn your head towards your left armpit\n"
        "3. Then using your left arm, gently push your head down looking towards your left armpit until you feel a slight stretch along with right side of your neck\n"
        "4. Hold this position for 15 to 20 seconds\n"
        "5. Repeat on the opposite side\n"
        "6. Aim for 3 repetitions of this stretch on each side\n", "https://www.youtube.com/watch?v=GSoXPJRnR6E", 24),
    Stretch("Belly Button Breathing", "1. Sit comfortably, with your knees bent and your shoulders, head and neck relaxed\n"
        "2. Place one hand on your upper chest and the other just below your rib cage. This will allow you to feel your diaphragm move as you breathe\n"
        "3. Breathe in slowly through your nose so that your stomach moves out against your hand. The hand on your chest should remain as still as possible\n"
        "4. Tighten your stomach muscles, so that your stomach moves back in, as you exhale through pursed lips. The hand on your upper chest must remain as still as possible", "https://www.youtube.com/watch?v=QRSbxS-uG9A", 31),
    Stretch("Pursed Lip Breathing", "1. Relax your neck and shoulder muscles\n"
        "2. Breathe in (inhale) slowly through your nose for two counts, keeping your mouth closed. Don't take a deep breath; a normal breath will do. It may help to count to yourself: inhale, one, two\n"
        "3. Pucker or \"purse\" your lips as if you were going to whistle or gently flicker the flame of a candle"
        "4. Breathe out (exhale) slowly and gently through your pursed lips while counting to four. It may help to count to yourself: exhale, one, two, three, four.", "https://www.youtube.com/watch?v=7kpJ0QlRss4", 32),
    Stretch("Mental Motivation", "1. Motivate Yourself With Your Mission\n"
        " - Invoke your broader mission and purpose in life as a powerful source of motivation. Apply that inspirational feeling and energy to your specific goals for the workout at hand\n"
        "2. Visualize Victory\n"
        " - See yourself vividly as already having crushed your workout. Use victorious memories from the past to infuse your vision with a feeling of inevitability. You can picture yourself successfully completing a set before you ever begin it to establish some early momentum\n"
        "3. Empty Your Mind\n"
        " - Put your attention on your breath, and allow it to deepen as you focus all your mental energy on the moment at hand. Do this until you’ve gotten out of your head, and into a more “flowing” state. When it comes time to train, your mind should only be on the exercises at hand", "https://www.youtube.com/watch?v=HnoPHqrdXQ8", 33)];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }
  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Stretch> matchQuery = [];
    for (var stretch in allStretches) {
      if (stretch.getName().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stretch);
      }
    }
    while (matchQuery.length > 8) {
      matchQuery.removeLast();
    }
    return Flexible(
        child: StretchList(
          stretches: matchQuery,
          onItemClick: (Stretch stretch){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StretchScreen(stretch)));
          },
        )
    );
  }
  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Stretch> matchQuery = [];
    for (var stretch in allStretches) {
      if (stretch.getName().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(stretch);
      }
    }
    // can only display 8. If the list is larger than 8 it goes off the screen.
    while (matchQuery.length > 8) {
      matchQuery.removeLast();
    }

    return Flexible(
        child: StretchList(
          stretches: matchQuery,
          onItemClick: (Stretch stretch){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StretchScreen(stretch)));
          },
        )
    );
  }
}