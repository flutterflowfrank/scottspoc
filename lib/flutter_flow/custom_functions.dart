import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? mipCheckDocumentRefFromString() {
// Master copy of the MIP Checks document.
  return FirebaseFirestore.instance
      .collection('mip_checks')
      .doc("BX48YfUufeLlEtFNaz6I");
}

DocumentReference? startupCheckListRefFromString() {
// Master copy of the MIP Checks document.
  return FirebaseFirestore.instance
      .collection('startup_checklists')
      .doc("SbUVMIg2aE4DhB4Cj5KS");
}
