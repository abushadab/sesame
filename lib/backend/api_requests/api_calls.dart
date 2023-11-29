import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MS LMS Group Code

class MsLmsGroup {
  static String baseUrl = 'https://hostkoro.com/sarath/wp-json/ms_lms/v2/';
  static Map<String, String> headers = {
    'token': '[token]',
  };
  static SectionsCall sectionsCall = SectionsCall();
  static CompleteALessonCall completeALessonCall = CompleteALessonCall();
}

class SectionsCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sections',
      apiUrl: '${MsLmsGroup.baseUrl}course_curriculum?id=$id',
      callType: ApiCallType.POST,
      headers: {
        'token': '$token',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic sections(dynamic response) => getJsonField(
        response,
        r'''$.sections''',
        true,
      );
  dynamic materials(dynamic response) => getJsonField(
        response,
        r'''$.materials''',
        true,
      );
}

class CompleteALessonCall {
  Future<ApiCallResponse> call({
    int? courseId,
    int? itemId,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Complete A Lesson',
      apiUrl:
          '${MsLmsGroup.baseUrl}course/lesson/complete?course_id=$courseId&item_id=$itemId',
      callType: ApiCallType.POST,
      headers: {
        'token': '$token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End MS LMS Group Code

class AccountCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'account',
      apiUrl: 'https://hostkoro.com/sarath/wp-json/ms_lms/v2/account',
      callType: ApiCallType.GET,
      headers: {
        'token': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic avatarurl(dynamic response) => getJsonField(
        response,
        r'''$.avatar_url''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic metafacebook(dynamic response) => getJsonField(
        response,
        r'''$.meta.facebook''',
      );
  static dynamic metaposition(dynamic response) => getJsonField(
        response,
        r'''$.meta.position''',
      );
  static dynamic metafirstname(dynamic response) => getJsonField(
        response,
        r'''$.meta.first_name''',
      );
  static dynamic metalastname(dynamic response) => getJsonField(
        response,
        r'''$.meta.last_name''',
      );
  static dynamic ratingtotal(dynamic response) => getJsonField(
        response,
        r'''$.rating.total''',
      );
  static dynamic ratingaverage(dynamic response) => getJsonField(
        response,
        r'''$.rating.average''',
      );
  static dynamic ratingmarksnum(dynamic response) => getJsonField(
        response,
        r'''$.rating.marks_num''',
      );
  static dynamic ratingtotalmarks(dynamic response) => getJsonField(
        response,
        r'''$.rating.total_marks''',
      );
  static dynamic ratingpercent(dynamic response) => getJsonField(
        response,
        r'''$.rating.percent''',
      );
  static dynamic totalcourses(dynamic response) => getJsonField(
        response,
        r'''$.total_courses''',
      );
}

class SendotpCall {
  static Future<ApiCallResponse> call({
    String? countrycode = '+880',
    String? mobileNo = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'sendotp',
      apiUrl: 'https://hostkoro.com/sarath/wp-json/digits/v1/send_otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'countrycode': countrycode,
        'mobileNo': mobileNo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic accountkit(dynamic response) => getJsonField(
        response,
        r'''$.accountkit''',
      );
  static dynamic firebase(dynamic response) => getJsonField(
        response,
        r'''$.firebase''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic datamessage(dynamic response) => getJsonField(
        response,
        r'''$.data.message''',
      );
}

class OneclickLoginAndSignupCall {
  static Future<ApiCallResponse> call({
    String? countrycode = '+880',
    String? mobileNo = '',
    String? otp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Oneclick Login and Signup',
      apiUrl: 'https://hostkoro.com/sarath/wp-json/digits/v1/one_click',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'countrycode': countrycode,
        'mobileNo': mobileNo,
        'otp': otp,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic loginsuccess(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic dataaccesstoken(dynamic response) => getJsonField(
        response,
        r'''$.data.access_token''',
      );
  static dynamic datatokentype(dynamic response) => getJsonField(
        response,
        r'''$.data.token_type''',
      );
  static dynamic dataztoken(dynamic response) => getJsonField(
        response,
        r'''$.data.ztoken''',
      );
  static dynamic datamsg(dynamic response) => getJsonField(
        response,
        r'''$.data.msg''',
      );
}

class CourseSingleCall {
  static Future<ApiCallResponse> call({
    String? token = '1|3b39b37cb9a70f5c018557f427416b67',
    int? courseId,
    int? itemId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Course Single',
      apiUrl:
          'https://hostkoro.com/sarath/wp-json/ms_lms/v2/course/lesson?course_id=$courseId&item_id=$itemId',
      callType: ApiCallType.POST,
      headers: {
        'token': '$token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic sectionlabel(dynamic response) => getJsonField(
        response,
        r'''$.section.label''',
      );
  static dynamic sectionnumber(dynamic response) => getJsonField(
        response,
        r'''$.section.number''',
      );
  static dynamic nextlesson(dynamic response) => getJsonField(
        response,
        r'''$.next_lesson''',
      );
  static dynamic nextlessontype(dynamic response) => getJsonField(
        response,
        r'''$.next_lesson_type''',
      );
  static dynamic nextlessonavailable(dynamic response) => getJsonField(
        response,
        r'''$.next_lesson_available''',
      );
  static dynamic completed(dynamic response) => getJsonField(
        response,
        r'''$.completed''',
      );
  static dynamic param(dynamic response) => getJsonField(
        response,
        r'''$.param''',
      );
  static dynamic videoid(dynamic response) => getJsonField(
        response,
        r'''$.video''',
      );
  static dynamic postar(dynamic response) => getJsonField(
        response,
        r'''$.video_poster''',
      );
  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.type''',
      );
  static dynamic previousLessonType(dynamic response) => getJsonField(
        response,
        r'''$.prev_lesson_type''',
      );
  static dynamic previousLessonId(dynamic response) => getJsonField(
        response,
        r'''$.prev_lesson''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
