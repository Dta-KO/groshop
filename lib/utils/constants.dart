/*
 * Created by Nguyen Kim Khanh on 4/13/22, 7:20 AM
 *     goodhere.cpm@gmail.com
 *     Last modified 4/13/22, 7:20 AM
 *     Copyright (c) 2022.
 *     All rights reserved.
 */
//this class is constants, not for rewrite.
class Constants {
  //for root collection vietnamese
  static const String vi = "vi";

  //for category (document)
  static const String category = "category";
  static const String root = "root";
  static const String dry_cleaning = "dry_cleaning";
  static const String pawn = "pawn";
  static const String for_rent = "for_rent";
  static const String hotel = "hotel";
  static const String supermarket = "supermarket";
  static const String pharmacy = "pharmacy";

  /// DATABASE COLLECTION NAMES USED IN APP
  ///
  static const String C_APP_INFO = "AppInfo";
  static const String C_USERS = "Users";
  static const String C_FLAGGED_USERS = "FlaggedUsers";
  static const String C_CONNECTIONS = "Connections";
  static const String C_MATCHES = "Matches";
  static const String C_CONVERSATIONS = "Conversations";
  static const String C_LIKES = "Likes";
  static const String C_VISITS = "Visits";
  static const String C_DISLIKES = "Dislikes";
  static const String C_MESSAGES = "Messages";
  static const String C_NOTIFICATIONS = "Notifications";

  /// DATABASE SHARED FIELDS FOR COLLECTION
  ///
  static const String TIMESTAMP = "timestamp";

  /// DATABASE FIELDS FOR Notifications COLLECTION ///
  ///
  static const N_SENDER_ID = "n_sender_id";
  static const N_SENDER_FULLNAME = "n_sender_fullname";
  static const N_SENDER_PHOTO_LINK = "n_sender_photo_link";
  static const N_RECEIVER_ID = "n_receiver_id";
  static const N_TYPE = "n_type";
  static const N_MESSAGE = "n_message";
  static const N_READ = "n_read";

  //for subcategory in dry_cleaning (collection)
  static const String dress_vest = "dress_vest";
  static const String baby_cleaning = "baby_cleaning";
  static const String blanket_cleaning = "blanket_cleaning";
  static const String vali_cleaning = "vali_cleaning";
  static const String general_laundry = "general_laundry";
  static const String wet_wash = "wet_wash";
  static const String dried_fragrant = "dried_fragrant";

  //for USER
  static const String ID = "id";
  static const String NAME = "name";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String ADDRESS = "address";
  static const String EMAIL = "email";
  static const String SEX = "sex";
  static const String BIRTHDAY = "birthday";
  static const String AMOUNT = "amount";
  static const String IMAGE = "image";
  static const String PURCHASED_PRODUCTS = "purchasedProducts";
  static const String ORDER_PRODUCTS = "orderProducts";
  static const String TOKEN = "token";


  ///
  /// DATABASE COLLECTIONS FIELD - SECTION
  ///
  /// FIREBASE MESSAGING TOPIC
  static const NOTIFY_USERS = "NOTIFY_USERS";




  static const String noProductDemo =
      "https://raw.githubusercontent.com/Dta-KO/Dta-KO.github.io/339952e851cc97b9ee7840aa390883cc2952f955/no_image.png";
}
