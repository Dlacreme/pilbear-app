import 'package:flutter/widgets.dart';

Image profilePicture(String url) {
  return Image.network(
    (url != null && url != '')
        ? url
        : 'https://raw.githubusercontent.com/Dlacreme/pilbear-assets/master/user.png?token=ABUWQHLB7KFZDOUQ5IG3L3K6MOUNI',
    width: 200,
  );
}
