import 'package:flutter/material.dart';

class Styles {
  static const _textSizeDefault = 18.0;
  static const _textSizeDescription = 15.0;
  static const _textSizeSmallDescription = 13.0;
  static const _textSizeModalTitleSecond = 20.0;
  static const _textSizeModalTitle = 24.0;
  static const _textSizeTitleCostData = 34.0;

  static final Color _textColorBlack = Color(0xFF222222);
  static final Color _textColorDark = Color(0xFF252525);
  static final Color _textColorWhite = Color(0xFFFFFFFF);
  static final Color _textColorGray = Color(0xFF979797);
  static final Color _textColorBlue = Color(0xF22280CE);
  static final Color _textColorRed = Color(0xFFD31717);
  static final Color _textColorBeige = Color(0xFFE8C883);

  static final FontWeight _textWeightBold = FontWeight.w700;
  static final FontWeight _textWeightMedium = FontWeight.w500;

  static final titleOld = TextStyle(fontSize: _textSizeDefault, fontWeight: _textWeightBold, color: _textColorGray);
  static final descriptionOld = TextStyle(fontSize: _textSizeDescription, color: _textColorGray);

  static final titleNew = TextStyle(fontSize: _textSizeDefault, fontWeight: _textWeightBold, color: _textColorDark);
  static final descriptionNew = TextStyle(fontSize: _textSizeDescription, color: _textColorDark);

  static final titleModal = TextStyle(fontSize: _textSizeModalTitle, fontWeight: _textWeightBold, color: _textColorDark);
  static final dateModal = TextStyle(fontSize: _textSizeDefault, color: _textColorBlue);
  static final descriptionModal = TextStyle(fontSize: _textSizeDefault, color: _textColorGray);

  static final titleWhite = TextStyle(fontSize: _textSizeModalTitle, fontWeight: _textWeightBold, color: _textColorWhite);
  static final descriptionImportant = TextStyle(fontSize: _textSizeDescription, color: _textColorRed);

  static final titleTabActive = TextStyle(fontSize: _textSizeDefault, fontWeight: _textWeightBold, color: _textColorWhite);
  static final titleTabDefault = TextStyle(fontSize: _textSizeDefault, color: _textColorWhite);

  static final titleCost = TextStyle(fontSize: _textSizeModalTitleSecond, color: _textColorBlack);
  static final titleCostData = TextStyle(fontSize: _textSizeTitleCostData, fontWeight: _textWeightBold, color: _textColorBlue);

  static final subtitleModal = TextStyle(fontSize: _textSizeDefault, color: _textColorGray);

  static final styleInput = TextStyle(fontSize: _textSizeDefault, color: _textColorDark);
  static final styleDescription = TextStyle(fontSize: _textSizeDescription, color: _textColorBeige);

  static final labelInputWhite = TextStyle(fontSize: _textSizeDefault, fontWeight: _textWeightMedium, color: _textColorWhite);
  static final hintWhite = TextStyle(fontSize: _textSizeDefault, color: _textColorWhite);

  static final styleSmallDescription = TextStyle(fontSize: _textSizeSmallDescription, color: _textColorDark);
  static final styleSmallDescriptionGray = TextStyle(fontSize: _textSizeSmallDescription, color: _textColorGray);
}
