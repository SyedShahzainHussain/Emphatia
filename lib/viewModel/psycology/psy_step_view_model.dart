import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/psychologist_login.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:http_parser/src/media_type.dart' show MediaType;

class PsyStepViewModel with ChangeNotifier {
  final _repo = AuthRepository();
  bool _isPsyStepLoading = false;
  bool get isPsyStepLoading => _isPsyStepLoading;

  setPsyStepLoading(bool isPsyStepLoading) {
    _isPsyStepLoading = isPsyStepLoading;
    notifyListeners();
  }

  // ! cnic loading

  bool _isPsyCnicStepLoading = false;
  bool get isPsyCnicStepLoading => _isPsyCnicStepLoading;

  setCnicPsyStepLoading(bool isPsyCnicStepLoading) {
    _isPsyCnicStepLoading = isPsyCnicStepLoading;
    notifyListeners();
  }

  // ! degree loading

  bool _isPsyDegreeStepLoading = false;
  bool get isPsyDegreeStepLoading => _isPsyDegreeStepLoading;

  setPsyDegreeStepLoading(bool isPsyDegreeStepLoading) {
    _isPsyDegreeStepLoading = isPsyDegreeStepLoading;
    notifyListeners();
  }
  // ! licence loading

  bool _isPsylicenceStepLoading = false;
  bool get isPsylicenceStepLoading => _isPsylicenceStepLoading;

  setPsylicenceStepLoading(bool isPsylicenceStepLoading) {
    _isPsylicenceStepLoading = isPsylicenceStepLoading;
    notifyListeners();
  }

  // ! step post api
  void postPsyStepApi(dynamic body, BuildContext context) async {
    setPsyStepLoading(true);
    _repo.postApi(body, TAPiString.ageGender).then((value) {
      if (kDebugMode) {
        print(value);
      }
      THelperFunction.showToast("Success");
      context.read<PsychologistController>().nextPage(context);

      setPsyStepLoading(false);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      THelperFunction.showToast(error.toString());
      setPsyStepLoading(false);
    });
  }

  // ! step cnic post api

  void postPsyCnicAPi(File? image1, File? image2, BuildContext context,
      String cnicNumber, String email) async {
    setCnicPsyStepLoading(true);

    try {
      final request = MultipartRequest("POST", Uri.parse(TAPiString.cnic));
      // Process first image
      String? image1Ext = image1!.path.split(".").last;
      var file1 = await MultipartFile.fromPath("images", image1.path,
          contentType: MediaType("images", image1Ext));

      // Process second image
      String? image2Ext = image2!.path.split(".").last;
      var file2 = await MultipartFile.fromPath("images", image2.path,
          contentType: MediaType("images", image2Ext));

      request.fields["cnicNumber"] = cnicNumber;
      request.fields["email"] = email;
      request.files.add(file1);
      request.files.add(file2);

      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        setCnicPsyStepLoading(false);
        final responseJson = await response.stream.bytesToString();
        if (kDebugMode) {
          print(responseJson);
        }
        THelperFunction.showToast("Cnic Details Uploaded");
        Future.delayed(Duration.zero, () {
          context.read<PsychologistController>().nextPage(context);
        });
      } else if (response.statusCode == 400) {
        final errorResponse = await response.stream.bytesToString();
        final errorJson = jsonDecode(errorResponse);
        final errorMessage =
            errorJson['error'] ?? 'An unexpected error occurred';

        THelperFunction.showToast(errorMessage);
        setCnicPsyStepLoading(false);
        print(errorMessage);
      } else {
        setCnicPsyStepLoading(false);
        THelperFunction.showToast(response.reasonPhrase.toString());
        print(response.reasonPhrase.toString());
      }
    } catch (e) {
      setCnicPsyStepLoading(false);
      THelperFunction.showToast(e.toString());
      print(e.toString());
    }
  }

  // ! step degree image post api

  Future<void> postPsyDegreeApi(
      File? image, String email, BuildContext context) async {
    print(email);
    setPsyDegreeStepLoading(true);
    try {
      final request = MultipartRequest("POST", Uri.parse(TAPiString.degreeImg));
      final images = await MultipartFile.fromPath(
        "image",
        image!.path,
        contentType: MediaType("image", ".jpg"),
      );

      request.fields["email"] = email;
      request.files.add(images);

      final response = await request.send();
      if (response.statusCode == 200) {
        setPsyDegreeStepLoading(false);
        final responseJson = await response.stream.bytesToString();
        if (kDebugMode) {
          print(responseJson);
        }
        THelperFunction.showToast("Degree Images Uploaded");
        Future.delayed(Duration.zero, () {
          context.read<PsychologistController>().nextPage(context);
        });
      } else if (response.statusCode == 400) {
        final errorResponse = await response.stream.bytesToString();
        final errorJson = jsonDecode(errorResponse);
        final errorMessage =
            errorJson['error'] ?? 'An unexpected error occurred';

        THelperFunction.showToast(errorMessage);
        setPsyDegreeStepLoading(false);
      } else {
        setPsyDegreeStepLoading(false);
        THelperFunction.showToast(response.reasonPhrase.toString());
      }
    } catch (e) {
      THelperFunction.showToast(e.toString());
    }
  }

  // ! licence

  Future<void> postPsyLicenceApi(File? image, String email,
      String licencedNumber, BuildContext context) async {
    setPsylicenceStepLoading(true);
    try {
      String? image1Ext = image!.path.split(".").last;
      final request = MultipartRequest("POST", Uri.parse(TAPiString.degreeImg));
      final images = await MultipartFile.fromPath("image", image.path,
          contentType: MediaType("image", image1Ext), filename: "degree");

      request.fields["email"] = email;
      request.fields["licenceNumber"] = licencedNumber;
      request.files.add(images);

      final response = await request.send();
      if (response.statusCode == 201 || response.statusCode == 200) {
        setPsylicenceStepLoading(false);
        final responseJson = await response.stream.bytesToString();
        if (kDebugMode) {
          print(responseJson);
        }
        THelperFunction.showToast("Licenced Uploaded");
        Future.delayed(const Duration(seconds: 1), () {
          THelperFunction.navigatedToScreenWithPop(
              context, const PsychologistLogin());
        });
      } else if (response.statusCode == 400) {
        final errorResponse = await response.stream.bytesToString();
        final errorJson = jsonDecode(errorResponse);
        final errorMessage =
            errorJson['error'] ?? 'An unexpected error occurred';

        THelperFunction.showToast(errorMessage);
        setPsylicenceStepLoading(false);
      } else {
        setPsylicenceStepLoading(false);
        THelperFunction.showToast(response.reasonPhrase.toString());
      }
    } catch (e) {
      THelperFunction.showToast(e.toString());
    }
  }
}
