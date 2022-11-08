import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:travellingVendeur/styles/colorApp.dart';
import 'package:travellingVendeur/utils/api/apiUrl.dart';

class ApiService extends GetConnect {
  GetStorage box = GetStorage();
  void onInit() {
    httpClient.baseUrl = ApiUrl.baseUrl;
    print('init********00');
  }
 buyBillet(data) async {
    try {
      var response = await post(ApiUrl.baseUrl + "/billet/buy2", data);

      return {
        "color": response.statusCode == 203
            ? ColorsApp.greenLight
            : ColorsApp.bleuLight,
        "message": response.body['message'],
        "status" : response.statusCode
      };
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
/**
 *  Start Section Billet 
 */

  Future<List> getHistoriqueBilletAll() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getHistoriqueBilletAgence() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getHistoriqueBilletPV() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getHistoriqueBilletServeuse() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  newBillet(data) async {
    try {
      var response = await post(ApiUrl.baseUrl + "/api/voyages", data);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("voici error du get unique: $error");
      return false;
    }
  }

/**
 *  End Section Billet 
 */

/**
 *  Start Section voyage 
 */
  Future<List> getDataVoyagePointVente(idPointDeVente) async {
    try {
      print(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      var response = await post(ApiUrl.baseUrl + "/pointvente/voyage/readAll", {"idPointDeVente": idPointDeVente});
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getVoyageAll() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getVoyageAgence() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List> getVoyagePV() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  newVoyage(data) async {
    try {
      var response = await post(ApiUrl.baseUrl + "/api/voyages", data);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("voici error du get unique: $error");
      return false;
    }
  }

/**
 *  End Section voyage 
 */

/**
 *  Start Section Serveuse 
 */
  Future<List> getListServeusePV() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  newServeuse(data) async {
    try {
      var response = await post(ApiUrl.baseUrl + "/api/voyages", data);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("voici error du get unique: $error");
      return false;
    }
  }

/**
 *  End Section Serveuse 
 */

/**
 *  End Section voyage 
 */

/**
 *  Start Section Point de Vente 
 */
  Future<List> getListPV() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  newPV(data) async {
    try {
      var response = await post(ApiUrl.baseUrl + "/api/voyages", data);

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("voici error du get unique: $error");
      return false;
    }
  }

/**
 *  End Section Point de Vente 
 */

/**
 *  Start Section Vente 
 */
  Future<List> getListVendeU() async {
    try {
      var response = await get(ApiUrl.baseUrl + "/pointvente/voyage/readAll");
      if (response.statusCode == 200) {
        return (response.body['data'] as List).toList();
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("voici error du get unique: $error");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

/**
 *  End Section Vente 
 */

  // static returnListResponseGet(Response response, var eltmodel) {
  //   var model = checkResponseType(eltmodel);

  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseWModel =
  //           (response.data as List).map((e) => model.fromJson(e)).toList();
  //       return responseWModel;
  //     case 201:
  //       dynamic responseWModel =
  //           (response.data as List).map((e) => model.fromJson(e)).toList();
  //       return responseWModel;
  //     case 400:
  //       throw Exception(response.data.toString());
  //     case 401:
  //     case 403:
  //       return new CustomDio().refreshToken();
  //     case 500:
  //       throw Exception("INternal server problems try later");

  //     default:
  //   }
  // }

  // getData(String url, var model) async {
  //   var dio = await CustomDio().getApiClient();

  //   try {
  //     Response response = await dio.get("$url");

  //     print("fin du get unique de $model statut code: ${response.statusCode}");
  //     return returnListResponseGet(response, model);
  //   } catch (error, stacktrace) {
  //     print("voici error du get unique: $error");
  //     throw Exception("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }

  // returnResponseGet(Response response, var eltmodel) {
  //   var model = checkResponseType(eltmodel);
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseWModel = model.fromJson((response.data));
  //       return responseWModel;
  //     case 201:
  //       dynamic responseWModel = model.fromJson((response.data));
  //       return responseWModel;
  //     case 400:
  //       throw Exception(response.data.toString());
  //     case 401:
  //     case 403:
  //       return new CustomDio().refreshToken();
  //     case 500:
  //       throw Exception("Internal server problems try later");
  //       break;
  //     default:
  //   }
  // }

  // postData(String url, var data) async {
  //   var dio = await CustomDio().getApiClient();

  //   try {
  //     print("debut du poast de donnee dont les datas sont $data");

  //     Response response = await dio.post("$url", data: data);

  //     print("fin du post de donnees $data statut code: ${response.statusCode}");
  //     return returnResponsePost(response);
  //   } catch (error, stacktrace) {
  //     print("voici error du get unique: $error");
  //     throw Exception("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }

  // returnResponsePost(Response response) {
  //   switch (response.statusCode) {
  //     case 201:
  //       dynamic responseWModel = jsonDecode(response.data);
  //       return responseWModel;
  //     case 400:
  //       throw Exception(response.data.toString());
  //     case 401:
  //     case 403:
  //       return new CustomDio().refreshToken();
  //     case 500:
  //       throw Exception("Internal server problems try later");
  //       break;
  //     default:
  //   }
  // }

  // loginUser(String url, var data) async {
  //   var dio = await CustomDio().getApiClient();
  //   try {
  //     print("debut du login de l'utilisateur dont les datas sont $data");

  //     Response response = await dio.post("$url", data: data);
  //     print(
  //         "fin du login de l'utilisateur de donnees $data statut code: ${response.statusCode}");

  //     print(
  //       data,
  //     );

  //     return response.data;
  //   } catch (error, stacktrace) {
  //     print("voici error du get unique: $error");
  //     throw Exception("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }

  // patchData(String url, data) async {
  //   Dio _dioPatch = Dio();
  //   _dioPatch.options = BaseOptions(
  //     baseUrl: ApiUrl.baseUrl,
  //   );
  //   print(
  //       "Debut du patch d'informations suivantes $data a l\'url ${ApiUrl.baseUrl}+ /$url");
  //   var patcInformation = await _dioPatch.patch("$url",
  //       options: Options(headers: {
  //         "content-Type": "application/merge-patch+json",
  //         /*    "Authorization":
  //                                                   "Bearer ${response.data['token']}" */
  //       }, contentType: "application/merge-patch+json"),
  //       data: jsonEncode(data));
  //   print("Debut du patch d'informations");
  //   return returnResponsePatch(patcInformation);
  // }

  // returnResponsePatch(Response response) {
  //   switch (response.statusCode) {
  //     case 204:
  //       dynamic responseWModel = jsonDecode(response.data);
  //       return responseWModel;
  //     case 400:
  //       throw Exception(response.data.toString());
  //     case 401:
  //     case 403:
  //       return new CustomDio().refreshToken();
  //     case 500:
  //       throw Exception("Internal server problems try later");
  //       break;
  //     default:
  //   }
  // }

/* 
  getAndPostImg(Dio _dio, String urlDestImg) async {
/**
 * debut selection image
 */
    var imagel = ImagePicker();
    var image = await imagel.getImage(
        source: ImageSource.gallery,
        imageQuality: 10,
        maxHeight: 500,
        maxWidth: 500);
    print('upload started');
    File croppedFile = await ImageCropper.cropImage(
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      sourcePath: image.path,
    );
    print(croppedFile.path);
/**
 * fin selection image
 */
/**
 * debut formdata contenant image image {@croppedFile}
 * "key" : "value" reprensentent les eventuels autres elements a poster
 */
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
        croppedFile.path,
        filename: "Image.jpg",
        contentType: MediaType('image', 'png'),
      ),
    });
/**
 * fin formdata
 */
/**
 * debut post image
 */
    var upload = await _dio.post(
      "$urlDestImg",
      data: formData,
      options: Options(headers: {
        "accept": "application/ld+json",
      }),
    );

    return upload;
/**
 * fin post img
 */
  }
 */ /* 
  Future downlaodAndSaveDigestToStorage(
      context, String urlPath, String fileName, String finalPath) async {
    Directory d = Directory(finalPath);

    try {
      final file = File('${d.path}/$fileName.mp3');
      print('${d.path}/$fileName.mp3');
      await Dio().download(
        "${ApiUrl.baseUrl}" + urlPath,
        file.path,
        onReceiveProgress: (rec, total) {
          /*  setState(() {
         var    progressDowloading = ((rec / total) * 100).toStringAsFixed(0) + "%";
            print(progressDowloading);
            progress.update(message: "svp veillez patienter ");
          }); */
        },
      );
    } catch (e) {
      print(e);
    }
  }
 */
}
