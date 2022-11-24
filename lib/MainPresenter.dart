import 'Stretch.dart';

class MainPresenter {
  StretchView? view;
  List<Stretch> stretchList = [];

  MainPresenter();

  Future<void> fetchStretchList() async {
    if (view != null) {
      stretchList = [];
      view!.onStretchListUpdate();
    } else {
      print("main is null");
    }
  }
}

class StretchView {
  // If necessary, specify methods here that will be called in view in response to model updates
  void onStretchListUpdate() {}
}